export ADOC

init:
	@echo "\n==> Installing dependencies\n"
	@gem install bundler
	@bundle install
	@echo "\n==> Downloading Bourbon\n"
	@bundle exec bourbon install --force --path ./contrib/
	@echo "\n==> Generating contrib/print.css\n"
	@make css
	@echo "\nRemember to install the following font families:\n- Cardo\n- Lato\n"

css:
	@bundle exec sass contrib/print.sass contrib/print.css --style=compressed --sourcemap=none 

html: 
	@make css
	@if [ -a $(ADOC) ]; then \
		echo "\n==> Generating HTML" ; \
		bundle exec asciidoctor $(ADOC) ; \
		echo "\n==> Removing footnote square brackets" ; \
		python contrib/bracketless.py $(subst .adoc$,.html,$(ADOC)) ; \
		export HTML_EXPORTED=1 ; \
	else \
		echo "$(ADOC) does not exist" ; \
	fi;

pdf:
	@make html
	@echo "\n==> Generating PDF"
	@# @weasyprint $(subst .adoc$,.html,$(ADOC)) $(subst .adoc$,.pdf,$(ADOC))
	@prince $(subst .adoc$,.html,$(ADOC))

docx:
	@make html
	@echo "\n==> Generating DOCX"
	@pandoc -o $(subst .adoc$,.docx,$(ADOC)) $(subst .adoc$,.html,$(ADOC))

clean:
	@echo "\n==> Deleting auto generated files"
	@rm -rfv contrib/print.css
	@rm -rfv contrib/bourbon
	@find . -iname '*.pdf' | xargs rm -v
	@find . -iname '*.docx' | xargs rm -v
	@find . -iname '*.html' | xargs rm -v
	@find . -iname '.DS_Store' | xargs rm -v
