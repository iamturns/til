Jekyll cheatsheet
=================

A static site generator built with Ruby

Poole
-----

A solid starting setup for a Jekyll site

- Layouts, config, 404, rss feed
- Two nice looking mobile friendly themes

More;
- http://getpoole.com/
- https://github.com/poole/poole

### Not quite right

Some weird choices, I think

- `styles.scss` in the root directory?
- `public/favicon.ico`
    - What about older browsers who just hit the root URL for this file?

I think it's best to use as an example, pull things in, but that's it...

GitHub pages
------------

GitHub pages can compile your Jekyll source for you!

Great concept, but can be quite limiting

It seems common for people to keep Jekyll source within the 'master' branch, use Jekyll to compile it, and commit that to 'gh-pages' branch

So 'gh-pages' is purely the dist output

This allows you to use whatever Jekyll versions and plugins you like

You could also host it anywhere you like!

http://gon.to/2015/03/03/f-percent-number-ck-github-pages-for-jekyll-why-i-decided-to-use-digital-ocean/

Install
-------

Create `Gemfile`

```
source 'https://rubygems.org'
gem 'jekyll'
```

```
bundle install
```

Run
---

```
jekyll serve
```

http://localhost:4000

Update
------

```
bundle update
```

Usage
-----

Build it:

```
jekyll build
```

Load up server, with watch files / reload:

```
jekyll serve
```

Directory structure
-------------------

- `_config.yml`
    - Optional
    - https://jekyllrb.com/docs/configuration/
- `.jekyll-metadata`
    - Git ignore it
- `_site`
    - Generated site by Jekyll
    - Git ignore it
- `_includes`
    - Partials
    - Included with: {% include file.ext %}
- `_layouts`
    - Included via Front Matter
    - Inject content: `{{ content }}`
- `_data`
    - File types: `.yml`, `.yaml`, `.json`, `.csv`
    - Accessible via `site.data`
    - Eg: a file `members.yml` is accessed via `site.data.members`
- `index.html`
    - You'll probably want at least this to get going!

### Other files

- Any `.html` or `.md` file with Front Matter (see later) that sits in the root directory or any other directory not listed above will be transformed by Jekyll
- Any remaining directories or files (eg: css, images, favicon.ico) will be copied to the generated site too

Front Matter
------------

YAML at the top of a file

Starts and ends with 3 dashes

Eg:

```
---
layout: post
title: Blogging Like a Hacker
---
```

Any file with Front Matter is processed by Jekyll as a special file

It can be empty, to trigger Jekyl into action:

```
---
---
```

Collections
-----------

Sounds interesting, need to read later @TODO

- http://jekyllrb.com/docs/collections/
- http://ben.balter.com/2015/02/20/jekyll-collections/
- https://mademistakes.com/articles/jekyll-style-guide/
- http://webstoemp.com/blog/jekyll-more-than-a-blog-generator/
