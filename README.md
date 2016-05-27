# Cuducos's PhD writings 

I'm a PhD student in sociology at the [University of Essex](https://www.essex.ac.uk/) and my research focus is the political side of crowdfunding.

Here I share my writings, working papers, drafts etc. Feel free to read, comment, criticize, get in touch and so on.

Just in case: Yes, I'm geek enough to prefer a markdown language rather than a word processor; GitHub rather than word processors' comments and tracking tools.

As you probably have discovered by yourself, I'm not a native English speaker. I'm really sorry for all the small crimes I commit with your beloved language. I'd be really glad if you point them out.

If this introduction is not enough [start stalking me](http://cuducos.me).

## Resources

* [Crowdfunding and the reconfiguration of public and private space](conferences/cd2015.adoc) | [presentation slides](http://www.slideshare.net/cuducos/crowdfunding-and-the-reconfiguration-of-public-and-private-space)<br>
Paper submitted to the _ECREA Communication and Democracy Section Conference — Political Agency in the Digital Age_, Copenhagen Business School, 2015
* [Contemporary political theory and the possibilities within crowdfunding](research-design/politics.adoc)<br>
Literature review on politics, 2014
* [Crowdfunding and post-politics](http://www.slideshare.net/cuducos/s24b-goncalves-20140610)<br>
Presentation slides for the _Manchester International Summer School on Emerging Technologies_, University of Manchester, 2014
* [Post-politics and crowdfunding](research-design/research-design.adoc)<br>
Initial research design, 2014

## Printing friendly versions

### One command to rule them all

I added a shell script that goes through the four steps needed to generate `.html`, `.pdf` and `.docx` versions.

The basic usage is, being the CSS path relative to the AsciiDoctor file, and the Ascidoctor file **without** extention:

```console
$ ./contrib/gen.sh <CSS file> <AsciiDoctor file>
```

For example:

```console
./contrib/gen.sh ../print.css conferences/cd2015
```

If you prefer to generate them step by step, this is what lies behind the shell script:

#### HTML

To generate print friendly HTML use [AsciiDoctor Toolchain](http://asciidoctor.org/docs/install-toolchain/) and the [customized CSS](print.css) included in this repository.

For example:

```console
$ asciidoctor -a stylesheet=../print.css conferences/cd2015.adoc
```

I added is a custom script to remove the square brackets from AsciiDoctor's in-text footnote numbering (it requires [Python](https://python.org/) 3.5+):

```console
$ python contrib/bracketless.py conferences/cd2015.html
```

#### PDF

To generate a PDF, use [WeasyPrint](http://weasyprint.org/) to convert the HTML generated above.

For example:

```console
$ weasyprint conferences/cd2015.html conferences/cd2015.pdf
```

#### Word

If you prefer a Word version, use [Pandoc](http://johnmacfarlane.net/pandoc/) to convert the HTML generated above.

For example:

```console
$ pandoc -o conferences/cd2015.docx conferences/cd2015.html
```

## Credits

This research is possible due to the scholarship offered by [CAPES](http://capes.gov.br/), a government agency linked to the [Brazilian Ministry of Education](http://mec.gov.br).

[![CAPES](http://www.capes.gov.br/images/logo-capes.png)](http://www.capes.gov.br/)

These writings by [Eduardo Cuducos](http://cuducos.me/) are licensed under a [Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/).

[![Creative Commons License](https://i.creativecommons.org/l/by/4.0/88x31.png)](http://creativecommons.org/licenses/by/4)
