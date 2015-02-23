HTML email template scaffold
============================

The best I've found is:

https://github.com/mailchimp/email-blueprints/blob/master/modular-template-patterns/modular-template-patterns.html

New tables:

```
<table border="0" cellpadding="0" cellspacing=”0” width=”100%”>
```

New cells:

```
<td width=”100%” align=”center” valign="top">
```

Gmail
-----

- `<style>` must be in `<head>`, not `<body>`
- Only element selectors, no class names or IDs matches (eg: table, div)
- Strips out media queries

More oddities
-------------

- Avoid padding and margins - use extra tr/td rows with spacer gifs
- Mark every media style rule as !important

Style embedders
---------------

Mailchimp seems to be the best:
http://templates.mailchimp.com/resources/inline-css/

http://premailer.dialect.ca/

This one looks interesting too (Downloadable PHP script)
http://www.pelagodesign.com/sidecar/emogrifier/

And this, with API:
http://inlinestyler.torchboxapps.com/
