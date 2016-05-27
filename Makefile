export ADOC

html: 
	@if [ -a $(ADOC).adoc ]; \
    then \
        echo "\n==> Generating HTML" ; \
        asciidoctor $(ADOC).adoc ; \
        echo "\n==> Removing footnote square brackets" ; \
        python contrib/bracketless.py $(ADOC).html ; \
        export HTML_EXPORTED=1 ; \
	else \
	    echo "$(ADOC).adoc does not exist" ; \
	fi;

pdf:
	@make html
	@echo "\n==> Generating PDF"
	@weasyprint $(ADOC).html $(ADOC).pdf

docx:
	@make html
	@echo "\n==> Generating DOCX"
	@pandoc -o $1.docx $1.html

clean:
	@echo "\n==> Deleting auto generated files"
	@find . -iname '*.pdf' | xargs rm -v
	@find . -iname '*.docx' | xargs rm -v
	@find . -iname '*.html' | xargs rm -v
	@find . -iname '.DS_Store' | xargs rm -v
