These files are an exact copy of the styles used in `asciidoctor-epub3` except by these customizations at the bottom of `epub3.css`:


```css
p.lead {
  font-style: italic;
  text-align: right;
}

blockquote > p {
  font-size: 0.95em;
  font-style: normal;
  line-height: 1.2;
}

blockquote > p:first-of-type::before {
  content: none;
}

ul.references {
  list-style: none inside none;
}

ul.references > li:before {
  content: none;
}
```
