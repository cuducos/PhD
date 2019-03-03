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
Also presented at the _2015 Centre for European Policy Studies Winter School — From Uber to Amazon Mechanical Turk_<br>
Brussels, 2015<br>
( [paper](conferences/cd2015.adoc) | [presentation slides](https://speakerdeck.com/cuducos/crowdfunding-and-the-reconfiguration-of-public-and-private-space-1) )
* **Contemporary political theory and the possibilities within crowdfunding**<br>
[Literature review](research-design/politics.adoc) on politics, 2014
* **Crowdfunding and post-politics**<br>
[Presentation slides](https://speakerdeck.com/cuducos/crowdfunding-and-post-politics) for the _Manchester International Summer School on Emerging Technologies_<br>
University of Manchester, 2014
* **Post-politics and crowdfunding**<br>
Initial [research design](research-design/research-design.adoc), 2014

## Installing dependencies

The following commands and scripts depend on the following binaries available in your path: `gem`, `asciidoctor`, `python` (version 3.4+), `prince` and `pandoc`.

Once you have installed these packages, you can automatically install some dependencies:

```console
$ make init
```

## Generating print friendly versions

A script helps you generating nice HTML, PDF and Word versions of the files. Use `pipenv shell` to activate the environment and run:

```console
$ python render.py <path to AsciiDoctor file>
```

Example:

```console
$ python render.py conferences/cd2015.adoc

```

While you are working you can watch for changes and the files will be generated automatically:

```console
$ python render.py
```

There is also a shortcut to clean all the auto-generated files:

```console
$ make clean
```

## Credits

This research is possible due to the scholarship offered by [CAPES](http://capes.gov.br/), a government agency linked to the [Brazilian Ministry of Education](http://mec.gov.br).

[![CAPES](http://www.capes.gov.br/images/logo-capes.png)](http://www.capes.gov.br/)

These writings by [Eduardo Cuducos](http://cuducos.me/) are licensed under a [Creative Commons Attribution-NonCommercial 4.0 International](http://creativecommons.org/licenses/by-nc/4.0/).

[![Creative Commons License](https://licensebuttons.net/l/by-nc/4.0/88x31.png)](http://creativecommons.org/licenses/by-nc/4.0/)
