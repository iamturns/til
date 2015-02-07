Convert icomoon output to SCSS variables
========================================

- Search for: `.icon`
- Replace with: `$icomoon`

- Search for regex: `:before \{\n(.*?)content`
- Replace with: `` (blank)

- Search for regex: `}\n\n`
- Replace with: `` (blank)

- Search for: `"`
- Replace with: `'`
