###

Sticky Header Knockout
======================

- Stick a header to the screen when scrolled into view
- Headers knockout and replace the sticky header as the container scrolls

Dependencies
------------

- jQuery

Example
=======

Javascript
----------

```
stickyHeaderKnockout = new HelperStickyHeaderKnockout
  $headers: $('.header')
  $stickyHeader: $('.sticky-header')
```

CSS
---

```
.sticky-header {
  left: 0;
  position: fixed;
  right: 0;
  top: 0;
}
```

Options
=======

- $headers
  - Mandatory
  - jQuery object, eg: `$('.header')`
  - Header elements will become sticky when scrolled into view
- $stickyHeader
  - Mandatory
  - jQuery object, eg: `$('.sticky-header')`
  - Header currently sticky (if any) will be embedded within this element
- $container
  - Optional
  - Default: `$(window)`
  - jQuery object of scrollable container
- padding
  - Optional
  - Default: 0
  - Add padding to the scroll measurement code, for headers that aren't stuck to the top
- classStickyHeaderIsVisible
  - Optional
  - Default: null
  - Add a class to the sticky header when visible
- classStickyHeaderIsNudging
  - Optional
  - Default: null
  - Add a class to the sticky header when nudged
- classHeaderIsNudging
  - Optional
  - Default: null
  - Add a class to the header when nudging the sticky header
- fastScrollSpeed
  - Optional
  - Default: 50
  - Some calculations are skipped to avoid overload if the container scrolls faster than this speed

###

define(
  [
    'jquery'
  ],
  (
    $
  ) ->

    class HelperStickyHeaderKnockout

      DEFAULT_OPTIONS = {
        $headers: null
        $stickyHeader: null
        $container: $(window)
        padding: 0
        classStickyHeaderIsVisible: null
        classStickyHeaderIsNudging: null
        classHeaderIsNudging: null
        fastScrollSpeed: 50
      }

      constructor: (options = {}) ->
        @options = @_processOptions(options)
        @headers = @_processHeaders()
        @headersReversed = @headers.slice(0).reverse()
        @_setupStickyHeaders()
        @_setupEvents()
        @_update()

      _calculateContainerScrollTop: ->
        return @options.containerElement.scrollTop + @options.padding

      _calculateStickyHeader: (scrollTop) ->
        for header in @headersReversed
          if scrollTop >= header.positionTop
            return header
        return null

      _calculateStickyHeaderClassList: (stickyHeader, stickyHeaderNudge) ->
        classList = []
        if stickyHeader? and @options.classStickyHeaderIsVisible?
          classList.push(@options.classStickyHeaderIsVisible)
        if stickyHeaderNudge? and @options.classStickyHeaderIsNudging?
          classList.push(@options.classStickyHeaderIsNudging)
        return classList

      _calculateStickyHeaderNudge: (scrollTop) ->
        for header in @headersReversed
          scrollTopMin = header.positionTop - header.height
          scrollTopMax = header.positionTop
          if scrollTop > scrollTopMin and scrollTop < scrollTopMax
            return header
        return null

      _calculateStickyHeaderPosition: (scrollTop, stickyHeaderNudge) ->
        if not stickyHeaderNudge?
          return 0
        return ((scrollTop - stickyHeaderNudge.positionTop + stickyHeaderNudge.height) * -1)

      _eventContainerScroll: =>
        @_update()

      _isScrollingFast: (scrollTopNow, scrollTopPrevious) ->
        scrollSpeed = Math.abs(scrollTopNow - scrollTopPrevious)
        return scrollSpeed > @options.fastScrollSpeed

      _processHeaders: ->
        headers = []
        for headerElement in @options.$headers
          header = {}
          header.element = headerElement
          header.elementSticky = headerElement.cloneNode(true)
          header.positionTop = headerElement.offsetTop
          header.height = headerElement.offsetHeight
          headers.push(header)
        return headers

      _processOptions: (options) ->
        options = $.extend(true, {}, DEFAULT_OPTIONS, options)
        @_validateOptions(options)
        options.headerElements = options.$headers.get(0)
        options.stickyHeaderElement = options.$stickyHeader.get(0)
        options.containerElement = options.$container.get(0)
        return options

      _resetStickyHeaderClassList: ->
        classList = @options.stickyHeaderElement.classList

        if @options.classStickyHeaderIsVisible?
          classList.remove(@options.classStickyHeaderIsVisible)

        if @options.classStickyHeaderIsNudging?
          classList.remove(@options.classStickyHeaderIsNudging)

      _setStickyHeader: (header) ->
        return true if header is @stickyHeader
        stickyHeaderPrevious = @stickyHeader
        @stickyHeader = header

        if @stickyHeader?
          @stickyHeader.elementSticky.style.display = ''
          @options.stickyHeaderElement.style.height = @stickyHeader.height + 'px'
          @options.stickyHeaderElement.style.overflow = 'hidden'
        else
          @options.stickyHeaderElement.style.height = ''
          @options.stickyHeaderElement.style.overflow = ''

        if stickyHeaderPrevious?
          stickyHeaderPrevious.elementSticky.style.display = 'none'

      _setStickyHeaderClassList: (classList) ->
        classString = classList.join(' ')

        return true if classString is @stickyHeaderClassString

        @stickyHeaderClassString = classString

        @_resetStickyHeaderClassList()

        for classItem in classList
          @options.stickyHeaderElement.classList.add(classItem)

      _setStickyHeaderNudge: (stickyHeaderNudge) ->
        return true if stickyHeaderNudge is @stickyHeaderNudge

        if @stickyHeaderNudge? and @options.classHeaderIsNudging?
          @stickyHeaderNudge.element.classList.remove(@options.classHeaderIsNudging)

        @stickyHeaderNudge = stickyHeaderNudge

        if stickyHeaderNudge? and @options.classHeaderIsNudging?
          stickyHeaderNudge.element.classList.add(@options.classHeaderIsNudging)

      _setStickyHeaderPosition: (position) ->
        return true if position is @stickyHeaderPosition
        @stickyHeaderPosition = position
        @_setElementTranslateY(@options.stickyHeaderElement, position)

      _setElementTranslateY: (element, translateY) ->
        transformValue = "translate3d(0px, #{translateY}px, 0px)"

        element.style["-webkit-transform"] = transformValue
        element.style["-moz-transform"] = transformValue
        element.style["-ms-transform"] = transformValue
        element.style["-o-transform"] = transformValue
        element.style["transform"] = transformValue

      _setupEvents: ->
        @options.$container
          .on('scroll', @_eventContainerScroll)
          .trigger('scroll')

      _setupStickyHeaders: ->
        for header in @headers
          header.elementSticky.style.display = 'none'
          @options.stickyHeaderElement.appendChild(header.elementSticky)

      _update: (isForced = false) ->
        scrollTopPrevious = @scrollTop
        scrollTopNow = @_calculateContainerScrollTop()
        @scrollTop = scrollTopNow

        stickyHeader = @_calculateStickyHeader(scrollTopNow)
        @_setStickyHeader(stickyHeader)

        isScrollingFast = @_isScrollingFast(scrollTopNow, scrollTopPrevious)

        if isScrollingFast and not isForced
          stickyHeaderNudge = null
          stickyHeaderPosition = 0
        else
          stickyHeaderNudge = @_calculateStickyHeaderNudge(scrollTopNow)
          stickyHeaderPosition = @_calculateStickyHeaderPosition(scrollTopNow, stickyHeaderNudge)

        @_setStickyHeaderPosition(stickyHeaderPosition)
        @_setStickyHeaderNudge(stickyHeaderNudge)

        stickyHeaderClassList = @_calculateStickyHeaderClassList(stickyHeader, stickyHeaderNudge)
        @_setStickyHeaderClassList(stickyHeaderClassList)

        if not isForced
          @_updateFinal()

      _updateFinal: ->
        if @updateFinalTimeout?
          clearTimeout(@updateFinalTimeout)
          delete @updateFinalTimeout

        @updateFinalTimeout = setTimeout(
          => @_update(true)
          @options.fastScrollSpeed
        )

      _validateOptions: (options) ->
        if not options.$stickyHeader?
          throw new Error('Missing "$stickyHeader" option')

        if not options.$headers?
          throw new Error('Missing "$headers" option')

    return HelperStickyHeaderKnockout

)
