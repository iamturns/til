window.Accordion = class Accordion

  constructor: (@$el, @$panel, @class_is_open, @slide_duration) ->

  open: ->
    @$el.addClass(@class_is_open)
    @$panel.stop(true, true).slideDown(@slide_duration);

  close: ->
    @$el.removeClass(@class_is_open)
    @$panel.stop(true, true).slideUp(@slide_duration);

  toggle: ->
    if @is_open() then @close() else @open()

  is_open: ->
    @$el.hasClass(@class_is_open)

  is_closed: ->
    !@is_open()

window.Accordions = class Accordions

  default_options: {
    selector_accordions: '[data-js-accordion]'
    selector_accordion_trigger: '[data-js-accordion-trigger]'
    selector_accordion_panel: '[data-js-accordion-panel]'
    class_is_open: 'is-open'
    slide_duration: 500
    close_all_on_open: true
  }

  constructor: (@el, @$el, options = {}) ->
    @options = $.extend @default_options, options

    @accordions = @create_accordions()

    @attach_events(accordion) for accordion in @accordions

  create_accordions: ->

    accordions = []

    for accordion in @$el.find(@options.selector_accordions)

      $accordion = $(accordion)

      $accordion_panel = $accordion.find(@options.selector_accordion_panel)
      throw 'Could not find accordion panel' if $accordion_panel.length == 0

      accordion = new window.Accordion(
        $accordion,
        $accordion_panel,
        @options.class_is_open,
        @options.slide_duration
      )

      $accordion.data('accordion', accordion)

      accordions.push(accordion)

    accordions

  attach_events: (accordion) ->

    $accordion_trigger = accordion.$el.find(@options.selector_accordion_trigger)
    throw 'Could not find accordion trigger' if $accordion_trigger.length == 0

    $accordion_trigger.on 'click', (e) =>
      e.preventDefault()
      @event_trigger_click(accordion)

  event_trigger_click: (accordion) ->

    if accordion.is_closed() and @options.close_all_on_open
      accordion_to_close.close() for accordion_to_close in @accordions

    accordion.toggle()

# jQuery interface

(($) ->
  $.fn.accordions = (options = {}) ->
    return @each () ->
      el = @
      $el = $(el)
      newPluginInstance = new window.Accordions(el, $el, options)
      $el.data('accordions', newPluginInstance)
)(jQuery)

# Site implementation

(($) ->
  $ ->
    $('body').accordions()

)(jQuery)

