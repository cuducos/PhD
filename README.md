# Cuducos's PhD writings 

I completed my PhD in sociology at the [University of Essex](https://www.essex.ac.uk/) and my research focus was the political side of digital culture, having crowd funding as my case study.

Here I share [my thesis](https://cuducos.me/crowd-funding) as well as [working papers, drafts etc.](RESOURCES.md) Feel free to read, comment, criticize, get in touch and so on.

Just in case: Yes, I'm geek enough to prefer a markdown language rather than a word processor; Git rather than word processors' comments and tracking tools.

As you probably have discovered by yourself, I'm not a native English speaker. I'm really sorry for all the small crimes I commit with your beloved language. I'd be really glad if you point them out.

If this introduction is not enough [start stalking me](http://cuducos.me).

## Installing dependencies

The following commands and scripts depend on the following binaries available in your path: `gem`, `asciidoctor`, `python` (version 3.4+), `prince` and `pandoc`.

Once you have installed these packages, you can automatically install some dependencies:

```console
$ make init
```

## Generating human friendly versions

### HTML, PDF and Word versions

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

### E-book

The thesis is prepared to be published as an ebook:

```console
$ cd thesis
$ asciidoctor-epub3 ebook.adoc
```

Since Amazon's `kindlegen` seams to be broken (it throws a `Bad CPU type in executable` error in macOS), the Kindle version was created from the `.epub` using [Kindle Previwer 3](https://www.amazon.com/gp/feature.html?docId=1003018611).

## Credits

This research is possible due to the scholarship offered by [CAPES](http://capes.gov.br/), a government agency linked to the [Brazilian Ministry of Education](http://mec.gov.br).

[![CAPES](http://www.capes.gov.br/images/logo-capes.png)](http://www.capes.gov.br/)

These writings by [Eduardo Cuducos](http://cuducos.me/) are licensed under a [Creative Commons Attribution-NonCommercial 4.0 International](http://creativecommons.org/licenses/by-nc/4.0/).

[![Creative Commons License](https://licensebuttons.net/l/by-nc/4.0/88x31.png)](http://creativecommons.org/licenses/by-nc/4.0/)
