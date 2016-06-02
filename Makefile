export ADOC

html: 
	@if [ -a $(ADOC) ]; \
	then \
		echo "\n==> Generating HTML" ; \
		asciidoctor $(ADOC) ; \
		echo "\n==> Removing footnote square brackets" ; \
		python contrib/bracketless.py $(subst .adoc$,.html,$(ADOC)) ; \
		export HTML_EXPORTED=1 ; \
	else \
		echo "$(ADOC) does not exist" ; \
	fi;

pdf:
	@make html
	@echo "\n==> Generating PDF"
	@weasyprint $(subst .adoc$,.html,$(ADOC)) $(subst .adoc$,.pdf,$(ADOC))

docx:
	@make html
	@echo "\n==> Generating DOCX"
	@pandoc -o $(subst .adoc$,.docx,$(ADOC)) $(subst .adoc$,.html,$(ADOC))

clean:
	@echo "\n==> Deleting auto generated files"
	@find . -iname '*.pdf' | xargs rm -v
	@find . -iname '*.docx' | xargs rm -v
	@find . -iname '*.html' | xargs rm -v
	@find . -iname '.DS_Store' | xargs rm -v
