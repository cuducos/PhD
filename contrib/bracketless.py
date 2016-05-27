import argparse
import os
import re
import sys

# basic settings
PREFIX = '<sup class="footnote">'
SUFFIX = '</sup>'
REGEX = re.compile(r'({}\[)(.+?)(\]{})'.format(PREFIX, SUFFIX))


def remove_footnote_sq_brackets(path_to_html_file):

    if not os.path.isfile(path_to_html_file):
        print('  File `{}` not found.'.format(html), file=sys.stderr)
        return False

    with open(path_to_html_file, 'r+') as fh:
        contents = fh.read()
        fh.seek(0)
        fh.write(REGEX.sub(r'{}\2{}'.format(PREFIX, SUFFIX), contents))
        fh.truncate()

if __name__ == '__main__':

    # argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('html', help='HTML file name')
    args = parser.parse_args()

    # run
    remove_footnote_sq_brackets(args.html)
