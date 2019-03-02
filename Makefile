init:
	@echo "==> Installing Ruby dependencies"
	@gem install bundler
	@bundle install
	@echo "==> Installing Python dependencies"
	@pip install pipenv
	@pipenv install
	@echo "==> Downloading Bourbon"
	@bundle exec bourbon install --force --path ./contrib/
	@echo "==> Remember to install the following font families:\n    EB Garamond (https://fonts.google.com/specimen/EB+Garamond)\n    Lato (https://fonts.google.com/specimen/Lato)"
	@echo "==> Remember to install the following software:\n    Pandoc (https://pandoc.org)\n    Prince (https://princexml.com)"

clean:
	@echo "==> Deleting auto generated files"
	@find . -iname '.sass-cache' | xargs rm -rfv
	@find . -iname 'print.css' | xargs rm -v
	@find . -iname '*.pdf' | xargs rm -v
	@find . -iname '*.docx' | xargs rm -v
	@find . -iname '*.html' | xargs rm -v
	@find . -iname '.DS_Store' | xargs rm -v
	@echo "Done!"
