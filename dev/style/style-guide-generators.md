Style guide generators
======================

- Pattern lab
    - Follows 'Atomic design' principles (see below)
    - Uses mustache templates
    - Pretty heavy stuff
    - Too PHP heavy? Seems outdated. No gulp, markdown, etc.
    - Demo is feature rich, but a bit clunky
- Fabricator
    - Seems similar to Pattern Lab, but simpler, and maybe better?
    - Uses Markdown files
    - https://github.com/fbrctr/fabricator
    - http://fbrctr.github.io/demo/
- Living Style Guide
    - Ruby based
    - http://livingstyleguide.org/
    - Looks nice, but, all outputted in ONE giant page!
- Kalei
    - Client side only
- KSS
    - JSDoc style comments
- Styledown
    - KSS insppired
    - https://github.com/styledown/styledown
- Hologram
    - KSS inspired
    - Nice and simple, I like this!
    - http://trulia.github.io/hologram/
    - http://trulia.github.io/hologram-example/

More reading
------------

- http://alistapart.com/blog/post/style-guide-generator-roundup
- https://github.com/davidhund/styleguide-generators
- http://www.smashingmagazine.com/2015/04/an-in-depth-overview-of-living-style-guide-tools/
- http://styleguides.io/

Atomic design
=============

We're not designing pages, we're designing systems of components

Five levels;

- Atoms
    - Label
    - Input
    - Button
- Molecules
    - Label + Input + Button = Search form 
- Organisms
    - Logo + Navigation + Search Form = Header
    - Title + Thumbnail + Teaser text = Product
- Templates
    - Wireframes
    - Focus on character length, image size, etc
- Pages
    - Instance of template with real content
    - Cart page with 1 item, and cart page with 10 items
    