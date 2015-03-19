(($) ->

  window.InputChangeSubmit = class InputChangeSubmit

    DEFAULT_OPTIONS = {
      pre_submit_callback: ->
    }

    constructor: (@$input, options = {}) ->
      @options = $.extend({}, DEFAULT_OPTIONS, options)

      @$input.on 'change', @event_input_change

    event_input_change: (e) =>
      $form = @$input.closest('form')
      return if $form.length == 0

      callback_response = @options.pre_submit_callback()
      return if callback_response == false

      $form.submit()
      $form.prop('disabled', true)

  $.fn.inputChangeSubmit = (options = {}) ->
    return @.each ->
      $el = $(@)
      newPluginInstance = new window.InputChangeSubmit($el, options)
      $el.data('input_change_submit', newPluginInstance)

)(jQuery)