Folder structure
================

This is what I like :)

- docs/
    - common-tasks/
        - pull.md
        - workflow.md
    - overview/
        - directory-structure.md
        - libraries.md
    - setup/
        - dependencies.md
    - common-tasks.md
    - overview.md
    - setup.md
        - I found people don't scan these root documents, they browse by folder
        - So the root documents should only contain references to the files
- public/
    - fonts/
        - font-group-name/
            - font-name.eot
            - font-name.ttf
            - etc
    - images/
        - image-group-name/
            - image-name.jpg
        - image-name.jpg
    - javascripts/
        - app/
        - vendor/
            - For external JS you had to customize
            - Or unavailable via package managers
        - main.js
    - stylesheets/
        - animations/
        - blocks/
        - global/
            - _border-box.scss
            - _font-face.scss
            - _main.scss
        - mixins/
        - overrides/
        - vars/
        - main.scss
            - Import order;
                - Reset
                - External packages (bourbon, breakpoint-sass)
                - Setup
                    - external
                        - bourbon?
                        - breakpoint-sass?
                    - vars
                    - mixins
                    - animations
                - Output
                    - external
                        - carousel css?
                        - lightbox css?
                    - blocks
                    - global
                    - overrides

            