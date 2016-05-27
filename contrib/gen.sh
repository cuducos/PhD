echo "AsciiDoctor document: $1.adoc"

echo "\n==> Generating HTML"
asciidoctor $1.adoc

echo "\n==> Removing footnote square brackets"
python contrib/bracketless.py $1.html

echo "\n==> Generating PDF"
weasyprint $1.html $1.pdf

echo "\n==> Generating DOCX"
pandoc -o $1.docx $1.html
