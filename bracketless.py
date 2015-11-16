import argparse
import os.path
import re


def remove_footnote_sq_brackets(html):

    # basic settings
    prefix = '<sup class="footnote">'
    suffix = '</sup>'
    regex = re.compile(r'({}\[)(.+?)(\]{})'.format(prefix, suffix))

    # load and rewrite html
    if os.path.isfile(html):
        with open(html, 'r+') as fh:
            contents = fh.read()
            output = regex.sub(r'{}\2{}'.format(prefix, suffix), contents)
            fh.seek(0)
            fh.write(output)
            fh.truncate()
            return True

    # error message
    print('  File `{}` not found.'.format(html))

if __name__ == '__main__':

    # argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('html', help='HTML file name')
    args = parser.parse_args()

    # run
    remove_footnote_sq_brackets(args.html)
