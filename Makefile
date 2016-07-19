export ADOC

init:
	@echo "\n==> Installing dependencies\n"
	@gem install bundler
	@bundle install
	@echo "\n==> Downloading Bourbon\n"
	@bundle exec bourbon install --force --path ./contrib/
	@echo "\n==> Remember to install the following font families:\n\nCardo\nhttps://fonts.google.com/specimen/Cardo\n\nLato\nhttps://fonts.google.com/specimen/Lato"

css:
	@echo "\n==> Generating contrib/print.css"
	@bundle exec sass contrib/print.sass contrib/print.css --style=compressed --sourcemap=none 
	@echo "    CSS done!"

html: 
	@make css
	@if [ -a $(ADOC) ]; then \
		echo "\n==> Generating $(subst .adoc$,.html,$(ADOC))" ; \
		bundle exec asciidoctor $(ADOC) ; \
		echo "    Removing footnote square brackets" ; \
		python contrib/bracketless.py $(subst .adoc$,.html,$(ADOC)) ; \
		echo "    file://`pwd`/$(subst .adoc$,.html,$(ADOC))"; \
		echo "    HTML done!"; \
	else \
		echo "$(ADOC) does not exist" ; \
	fi;

pdf:
	@make html
	@echo "\n==> Generating $(subst .adoc$,.pdf,$(ADOC))"
	@prince $(subst .adoc$,.html,$(ADOC))
	@echo "    file://`pwd`/$(subst .adoc$,.pdf,$(ADOC))"
	@echo "    PDF done!"

docx:
	@make html
	@echo "\n==> Generating $(subst .adoc$,.docx,$(ADOC))"
	@pandoc -o $(subst .adoc$,.docx,$(ADOC)) $(subst .adoc$,.html,$(ADOC))
	@echo "    DOCX done!\n"

clean:
	@echo "\n==> Deleting auto generated files"
	@rm -rfv contrib/print.css
	@find . -iname '*.pdf' | xargs rm -v
	@find . -iname '*.docx' | xargs rm -v
	@find . -iname '*.html' | xargs rm -v
	@find . -iname '.DS_Store' | xargs rm -v
	@echo "Done!"
