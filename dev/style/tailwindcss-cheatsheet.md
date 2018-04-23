https://tailwindcss.com/docs/

* hover:{xxx}
* {screen}:{xxx}
* bg-{colour}
* bg-{position}
  * bottom, center, left, left-bottom, left-top, right, right-bottom, right-top, top
* Background repeat
  * bg-repeat
  * bg-no-repeat
  * bg-repeat-{x|y}
* bg-cover
* bg-contain
* border{-side?}{-width?}
  * side: t, r, b, l (default = all)
  * width: 0, 1, 2, 4, 8 (default = 1)
* border-{colour}
* border-{style}
  * style: solid, dashed, dotted, none
* rounded{-side?}{-width?}
  * side: t, r, b, l, tl, tr, br, bl (default = all)
  * width: none, sm, lg, full (default = medium)
* container
  * Sets max-width to match min-width of current breakpoint
* Display
  * block
  * inline-block
  * inline
  * table
  * table-row
  * table-cell
  * hidden
* Flex
  * flex
  * inline-flex
  * flex-row
  * flex-row-reverse
  * flex-col
  * flex-col-reverse
  * flex-no-wrap
  * flex-wrap
  * flex-wrap-reverse
* Justify content
  * justify-start (justify-content: flex-start)
  * justify-center (justify-content: center)
  * justify-end (justify-content: flex-end)
  * justify-between (justify-content: space-between)
  * justify-around (justify-content: space-around)
* Align items
  * items-stretch (align-items: stretch)
  * items-start (align-items: flex-start)
  * items-center (align-items: center)
  * items-end (align-items: flex-end)
  * items-baseline (align-items: baseline)
* Align content
  * content-start (align-content: flex-start)
  * content-center (align-content: center)
  * content-end (align-content: flex-end)
  * content-between (align-content: space-between)
  * content-around (align-content: space-around)
* Align self
  * self-auto (align-self: auto)
  * self-start (align-self: flex-start)
  * self-center (align-self: center)
  * self-end (align-self: flex-end)
  * self-stretch (align-self: stretch)
* Flex
  * flex-initial (flex: initial)
  * flex-1 (flex: 1)
  * flex-auto (flex: auto)
  * flex-none (flex: none)
  * flex-grow (flex-grow: 1)
  * flex-shrink (flex-shrink: 1)
  * flex-no-grow (flex-frow: 0)
  * flex-no-shrink (flex-shrink: 0)
* float-{direction}
  * direction: left, right, none
* clearfix
* appearance-none
* cursor-auto, cursor-pointer, cursor-not-allowed
* resize, resize-none, resize-y, resize-x
* pointer-events-none, pointer-events-auto
* select-none, select-text
* opacity-{size}
  * size: 0, 25, 50, 75, 100
* overflow-visible, overflow-auto, overflow-hidden
* overflow-scroll, overflow-x-scroll, overflow-y-scroll
* scrolling-touch, scrolling-auto
* static, fixed, absolute, relative
* pin{-direction?}
  * direction: t, r, b, l, y, x, none (default = all)
* shadow{-size?}
  * size: md, lg (default = small)
* shadow-inner, shadow-none
* w-auto, w-px (width: 1px), w-full, w-screen
* w-{size}
  * size: 1, 2, 3, 4, 6, 8, 10, 12, 16, 24, 32, 48, 64
* w-{grid}
  * grid: {1-5}/{2-6} (eg: grid-1/2)
* min-w-o, min-w-full
* max-w-{size}
  * size: xs, sm, md, lg, xl, 2xl, 3xl, 4xl, 5xl, full
* h-{size}
  * size: 1, 2, 3, 4, 6, 8, 10, 12, 16, 24, 32, 48, 64
* h-auto, h-px (height: 1px), h-full, h-screen
* min-h-0, min-h-full, min-h-screen
* max-h-full, max-h-screen
* Padding, margin, negative margin
  * {class}{side?}-{size}
    * class: p, m, -m
    * side: t, r, b, l, x, y (default = all)
    * space: 0, 1, 2, 3, 4, 5, 6, 8, px, auto)
* fill-current, stroke-current
* font-sans, font-serif, font-mono
* text-{color}
* text-{size}
  * size: xs, sm, base (1rem), lg, xl, 2xl, 3xl, 4xl, 5xl
* font-{weight}
  * weight: hairline, thin, light, normal, medium, semibold, bold, extrabold, black
* text-{direction}
  * direction: left, center, right, justify
* leading-{size}
  * size: none, tight, normal, loose
* tracking-{size}
  * size: tight, normal, wide
* italic, roman, uppercase, lowercase, capitalize, normal-case, underline, line-through, no-underline, antialised, subpixel-antialiased
* whitespace-normal, whitespace-no-wrap, whitespace-pre, whitespace-pre-line, whitespace-pre-wrap
* break-words, break-normal, truncate (ellipsis)
* align-{position}
  * position: baseline, top, middle, bottom, text-top, text-bottom
* visible, invisible
* z-{index}
  * index: 0, 10, 20, 30, 40, 50, auto
