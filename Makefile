export ADOC

init:
	@echo "==> Installing dependencies"
	@gem install bundler
	@bundle install
	@echo "==> Downloading Bourbon"
	@bundle exec bourbon install --force --path ./contrib/
	@echo "==> Remember to install the following font families:\n    Cardo (https://fonts.google.com/specimen/Cardo)\n    Lato (https://fonts.google.com/specimen/Lato)"

css:
	@echo "==> Generating contrib/print.css"
	@bundle exec sass contrib/print.sass contrib/print.css --style=compressed --sourcemap=none 
	@echo "    CSS done!"

html: 
	@make css
	@if [ -a $(ADOC) ]; then \
		echo "==> Generating $(subst .adoc$,.html,$(ADOC))" ; \
		bundle exec asciidoctor $(ADOC) ; \
		echo "    Removing footnote square brackets" ; \
		python contrib/bracketless.py $(subst .adoc$,.html,$(ADOC)) ; \
		echo "    HTML done! ./$(subst .adoc$,.html,$(ADOC))"; \
	else \
		echo "$(ADOC) does not exist" ; \
	fi;

pdf:
	@make html
	@echo "==> Generating $(subst .adoc$,.pdf,$(ADOC))"
	@prince $(subst .adoc$,.html,$(ADOC))
	@echo "    PDF done! ./$(subst .adoc$,.pdf,$(ADOC))"

docx:
	@make html
	@echo "==> Generating $(subst .adoc$,.docx,$(ADOC))"
	@pandoc -o $(subst .adoc$,.docx,$(ADOC)) $(subst .adoc$,.html,$(ADOC))
	@echo "    DOCX done! ./$(subst .adoc$,.docx,$(ADOC))"

clean:
	@echo "==> Deleting auto generated files"
	@find . -iname '.sass-cache' | xargs rm -rfv
	@find . -iname 'print.css' | xargs rm -v
	@find . -iname '*.pdf' | xargs rm -v
	@find . -iname '*.docx' | xargs rm -v
	@find . -iname '*.html' | xargs rm -v
	@find . -iname '.DS_Store' | xargs rm -v
	@echo "Done!"

watch:
	@ruby contrib/watcher.rb
