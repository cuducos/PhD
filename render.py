"""Cuducos PhD - tool to create PDF/DOCX from Asciidoctor files

Usage:
  render.py [<filename>]

Options:
  -h --help     Show this screen.

"""
import os
import re
import subprocess
from contextlib import contextmanager
from pathlib import Path
from time import sleep

from docopt import docopt
from watchdog.events import FileSystemEventHandler
from watchdog.observers import Observer


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
    full_path = Path(filename)

    print('==> Generating {}'.format(filename))
    yield filename
    print('    {} done! {}\n'.format(extension.upper(), full_path.absolute()))


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
        run(['bundle', 'exec', 'asciidoctor', asciidoctor])
        remove_footnote_square_brackets(html)

        return html


def renderer(asciidoctor):
    if not os.path.isfile(asciidoctor):
        raise RuntimeError('  File {} not found.'.format(asciidoctor))

    sass = os.path.join('contrib', 'print.sass')
    with new_file(sass, 'css') as css:
        run(['bundle', 'exec', 'sass', sass, css, '--style=compressed', '--sourcemap=none'])

    html = html_from(asciidoctor)

    with new_file(html, 'pdf'):
        run(['prince', html])

    with new_file(html, 'docx') as docx:
        run(['pandoc', '-o', docx, html])


class AsciiDoctorEventHandler(FileSystemEventHandler):

    @staticmethod
    def call_renderer(filename):
        if filename.lower().endswith('.adoc'):
            renderer(filename)

    def on_created(self, event):
        self.call_renderer(event.src_path)

    def on_modified(self, event):
        self.call_renderer(event.src_path)

    def on_moved(self, event):
        self.call_renderer(event.src_path)


def watcher():
    observer = Observer()
    observer.schedule(AsciiDoctorEventHandler(), os.getcwd(), recursive=True)
    observer.start()

    try:
        while True:
            sleep(1)

    except KeyboardInterrupt:
        observer.stop()

    observer.join()


if __name__ == '__main__':
    arguments = docopt(__doc__, version='1.0')

    if not arguments['<filename>']:
        print('==> Rendering all AsciiDoctor documents')
        for asciidoctor in Path().glob('**/*.adoc'):
            renderer(asciidoctor)

        print('==> Waiting for changes in any AsciiDoctor file')
        watcher()

    else:
        renderer(arguments['<filename>'])
