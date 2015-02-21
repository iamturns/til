(function($) {

    var isInputSupported = 'placeholder' in document.createElement('input');
    var isTextareaSupported = 'placeholder' in document.createElement('textarea');

    isInputSupported = false;

    if (isInputSupported && isTextareaSupported) {
        return;
    }

    $(document).ready(function() {

        $('[placeholder]').focus(function () {
            var input = $(this);
            if (input.val() == input.attr('placeholder') && input.data('placeholder')) {
                input.val('');
                input.removeClass('placeholder');
            }
        }).blur(function () {
            var input = $(this);
            if (input.val() == '') {
                input.addClass('placeholder');
                input.val(input.attr('placeholder'));
                input.data('placeholder', true);
            } else {
                input.data('placeholder', false);
            }
        }).blur().parents('form').submit(function () {
            $(this).find('[placeholder]').each(function () {
                var input = $(this);
                if (input.val() == input.attr('placeholder') && input.data('placeholder')) {
                    input.val('');
                }
            })
        });

    });

})(jQuery);
