(function($){
    var $body = $('body'),
        $toolbar = $('#toolbar'),
        $toggle = $toolbar.find('.toggle'),
        close = 'close',
        cook = 'toolbar-open',
        flip = 'flip-h',
        on = 'has-toolbar';

    function init() {
        if (readCookie(cook) === 'true' || readCookie(cook) === undefined) {
            $body.addClass(on);
        } else {
            $toolbar
                .addClass(close);
            $toggle.toggleClass(flip);
        }
        $toggle.click(toggleToolbar);
        $toolbar.show();
    }

    function toggleToolbar(e) {
        e.preventDefault();
        $body.toggleClass(on);
        $toolbar.toggleClass(close);
        $toggle.toggleClass(flip);
        createCookie(cook, $body.hasClass(on));
    }

    function createCookie(name, value, days) {
        var expires;
        if (days) {
            var date = new Date();
            date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
            expires = "; expires=" + date.toGMTString();
        } else { expires = ""; }
        document.cookie = name + "=" + value + expires + "; path=/";
    }

    function readCookie(name) {
        var nameEQ = name + "=",
            ca = document.cookie.split(';'),
            c,
            len = ca.length;

        for (var i = 0; i < len; i++) {
            c = ca[i];
            while (c.charAt(0) == ' ') {
                c = c.substring(1, c.length);
            }
            if (c.indexOf(nameEQ) === 0) {
                return c.substring(nameEQ.length, c.length);
            }
        }
    }

    $(init);
} (jQuery));
