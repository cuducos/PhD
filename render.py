"""Cuducos PhD - tool to create PDF/DOCX from Asciidoctor files

Usage:
  render.py <filename>

Options:
  -h --help     Show this screen.

"""
import os
import re
import subprocess
from contextlib import contextmanager

from docopt import docopt


def run(command):
    try:
        output = subprocess.check_output(command).decode('utf8')
    except subprocess.CalledProcessError as error:
        output = error.output.decode('utf8')

    print(output)


@contextmanager
def new_file(original, extension):
    basename, *_ = os.path.splitext(original)
    filename = '{}.{}'.format(basename, extension)

    print('==> Generating {}'.format(filename))
    yield filename
    print('    {} done! {}\n'.format(extension.upper(), filename))


def remove_footnote_square_brackets(html):
    PREFIX = '<sup class="footnote">'
    SUFFIX = '</sup>'
    REGEX = re.compile(r'({}\[)(.+?)(\]{})'.format(PREFIX, SUFFIX))

    with open(html, 'r+') as fh:
        contents = fh.read()
        fh.seek(0)
        fh.write(REGEX.sub(r'{}\2{}'.format(PREFIX, SUFFIX), contents))
        fh.truncate()


def html_from(asciidoctor):
    with new_file(asciidoctor, 'html') as html:
        run(['asciidoctor', asciidoctor])
        remove_footnote_square_brackets(html)

        return html


if __name__ == '__main__':
    arguments = docopt(__doc__, version='1.0')
    asciidoctor = arguments.get('<filename>')

    if not os.path.isfile(asciidoctor):
        raise RuntimeError('  File {} not found.'.format(asciidoctor))

    sass = os.path.join('contrib', 'print.sass')
    with new_file(sass, 'css') as css:
        run(['sass', sass, css, '--style=compressed', '--sourcemap=none'])

    html = html_from(asciidoctor)

    with new_file(html, 'pdf'):
        run(['prince', html])

    with new_file(html, 'docx') as docx:
        run(['pandoc', '-o', docx, html])
