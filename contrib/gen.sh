echo "AsciiDoctor document: $2.adoc"
echo "Path to the CSS is: $1 (relative to the AsciiDoctor document)"

echo "\n==> Generating HTML"
asciidoctor -a stylesheet=$1 $2.adoc

echo "\n==> Removing footnote square brackets"
python contrib/bracketless.py $2.html

echo "\n==> Generating PDF"
weasyprint $2.html $2.pdf

echo "\n==> Generating DOCX"
pandoc -o $2.docx $2.html
