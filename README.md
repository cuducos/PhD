# Cuducos's PhD writings 

I'm a PhD student in sociology at the [University of Essex](https://www.essex.ac.uk/) and my research focus is the political side of crowdfunding.

Here I share my writings, working papers, drafts etc. Feel free to read, comment, criticize, get in touch and so on.

Just in case: Yes, I'm geek enough to prefer a markdown language rather than a word processor; GitHub rather than word processors' comments and tracking tools.

As you probably have discovered by yourself, I'm not a native English speaker. I'm really sorry for all the small crimes I commit with your beloved language. I'd be really glad if you point them out.

If this introduction is not enough [start stalking me](http://cuducos.me).

## Resources

* **Crowdfunding and the reconfiguration of public and private space**<br>
Presented at the _Summer Doctoral Programme, Oxford Internet Institute_<br>
Oxford, 2016<br>
( [presentation slides](https://speakerdeck.com/cuducos/crowd-funding-and-politics-the-reconfiguration-of-public-and-private-space) )
* **Crowdfunding and the reconfiguration of public and private space**<br>
Presented at the _ECREA Communication and Democracy Section Conference — Political Agency in the Digital Age_<br>
Copenhagen, 2015<br>
( [paper](conferences/cd2015.adoc) | [presentation slides](https://speakerdeck.com/cuducos/crowdfunding-and-the-reconfiguration-of-public-and-private-space-1) )<br>
Also presented at the _2015 Centre for European Policy Studies Winter School “From Uber to Amazon Mechanical Turk”_<br>
Brussels, 2015<br>
( [paper](conferences/ceps2015.adoc) )<br>
* **Contemporary political theory and the possibilities within crowdfunding**<br>
[Literature review](research-design/politics.adoc) on politics, 2014
* **Crowdfunding and post-politics**<br>
[Presentation slides](https://speakerdeck.com/cuducos/crowdfunding-and-post-politics) for the _Manchester International Summer School on Emerging Technologies_<br>
University of Manchester, 2014
* **Post-politics and crowdfunding**<br>
Initial [research design](research-design/research-design.adoc), 2014

## Installing dependencies

The foloowing commands and scripts depend on the following binaries available in yout path: `gem`, `asciidoctor`, `python` (version 3.4+), `weasyprint` and `pandoc`.

Once you have installed these packages, you can autmatically install the gems and generate the CSS stylesheet:

```console
make init
```

## Generating print friendly versions

A `Makefile` helps you generating nice HTML, PDF and Word versions of the files:

```console
$ make <format> ADOC=<AsciiDoctor file>
```

Examples:

```console
$ make html ADOC=conferences/cd2015.adoc
$ make docx ADOC=conferences/cd2015.adoc
$ make pdf ADOC=conferences/cd2015.adoc

```
This depends on the following binaries available in yout path: `asciidoctor`, `python` (version 3.4+), `weasyprint` and `pandoc`.

There is also a shorcut to clean all the auto-generated files:

```console
$ make clean
```

If you prefer to generate them step by step, the follwoing sections describe what the shell scripts does for you.

### HTML

To generate print friendly HTML use [AsciiDoctor Toolchain](http://asciidoctor.org/docs/install-toolchain/).

For example:

```console
$ asciidoctor conferences/cd2015.adoc
```

I added is a custom script to remove the square brackets from AsciiDoctor's in-text footnote numbering (it requires [Python](https://python.org/) 3.4+):

```console
$ python contrib/bracketless.py conferences/cd2015.html
```

### PDF

To generate a PDF, use [WeasyPrint](http://weasyprint.org/) to convert the HTML generated above.

For example:

```console
$ weasyprint conferences/cd2015.html conferences/cd2015.pdf
```

### Word

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
