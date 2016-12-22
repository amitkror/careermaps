/*

  This plugin handles the form tabs interaction

  Call the plugin with $('jquery-selector').tabs();

  Usage:

    HTML:

      <nav class="form-tabs">
        <ul>
          <li><a href="#ticket-number-form" class="on" data-target="#ticket-number-form" title="Search By Ticket Number">By Ticket Number</a></li>
          <li><a href="#name-address-form" data-target="#name-address-form" title="Search By Name and Address">By Name and Address</a></li>
        </ul>
      </nav>

      <form class="form-default form-tabbed on" id="ticket-number-form"></form>
      <form class="form-default form-tabbed" id="name-address-form"></form>

    The current tab and form have an 'on' class.

    Each tab has a css selector corresponding to the element on the page to show.

    When the tab is clicked, the form is displayed and focused.

    Public Methods:

      openForm(formId)

      Open a form with a given id

      Example usage:

        $('.form-tabs')
          .data('tabs')
            .openForm('#name-address-form');

    This plugin uses the window.location.hash to open a tab/form by id.  If you want to start on a page with a hidden tab open, just add it's id to the URL.

      Example:

        /14-search-form-error.html#name-address-form

*/

;(function($, undefined){
  $.tabs = function(el, $el, options){
    // To avoid scope issues, use 'base' instead of 'this'
    // to reference this class from internal events and functions.
    var base = this,
        HASH_BANG = '#!/',
        ON = 'on',
        SCROLL_OFFSET = -100,
        TARGET = 'target',
        BUTTON = $('.button span');

    // Access to jQuery and DOM versions of element
    base.$el = $el;
    base.el = el;

    // Public function to open a form with a given id
    base.openForm = function(formId){
      if ($(formId).length > 0) {
        base.$el.find('a[href=' + formId + ']').click();
      }
    };

    function init(){

      // Add a click event to the tabs
      base.$el.find('a').on('click', onTabs);

      // Look at the hash object to see if we need to focus on a form.
      var hash = window.location.hash;
      if (hash !== '') {
        base.openForm(hash.split(HASH_BANG).join('#'));
      }
    }

    function onTabs(e) {
      e.preventDefault();

      // Get all of our forms related to the tabs
      var $el = $(e.currentTarget),
          ids = base.$el.find('a').map(function() {
            return $(this).data(TARGET);
          }).get();

      window.location.hash = HASH_BANG + $el.attr('href').split('#').join('');

      // Turn off the current form
      base.$el.find('a').removeClass(ON);

      // Hide all the forms
      $(ids.join(',')).hide();

      // Turn on our current tab
      $el.addClass(ON);

      // Show the form we're targeting
      var $targ = $($el.data(TARGET));
      $targ.show();

      $('html, body')
        .stop()

      BUTTON.on('click', function() {
        var href = BUTTON.data('href');
        window.location = href;
      })
    }

    // Run initializer
    init();
  };

  // our jQuery plugin magic.
  $.fn.tabs = function(options){

    return this.each(function(idx, el) {
      var $el = $(el),
          key = 'tabs';

      // Only create the plugin instance if it doesn't exist
      if (!$el.data(key)) {
        // Store plugin object in this element's data
        $el.data(key, new $.tabs(el, $el, options));
      }

    });

  };

})(jQuery);
