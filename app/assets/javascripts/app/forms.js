/*

This is a simple template for a jquery plugin.

Replace all instances of 'pluginName;' with your plugin name

Call the plugin with $('jquery-selector').pluginName({ foo:'custom-setting' });
*/

;(function($, undefined){
  $.ajax_formify = function(el, $el, options){
    // To avoid scope issues, use '_this' instead of 'this'
    // to reference this class from internal events and functions.
    var _this = this,
        $el,
        BOUNCE_DELAY = 500,
        getDataBounce,
        $formFilter = $('.clear-boxes'),
        $checkbox = $('.custom-checker'),
        $select = $('.filtered'),
        checked = 'checked',
        $all = $('#all');

    // Access to jQuery and DOM versions of element
    _this.$el = $el;
    _this.el = el;

    function init(){
      _this.options = $.extend({},$.ajax_formify.defaults, options);

      getDataBounce = debounce(_this.submit, BOUNCE_DELAY);

      //clear form
      $formFilter.click(_this.uncheckAll);

      // Listen to the input events
      $el.find($checkbox).add($select).on('change', getDataBounce);

      $all.click(_this.checkAll);

      $(document).on('change', '#per-page', getDataBounce);
    }


    _this.getChecked = function () {
      return $el.find('input');
    }

    _this.showJobs = function (e, r) {
      $("#results").add('#all-results').add('#career-results').append(r);
    }

    _this.submit = function () {
      // Submit our form
      $el.submit();
    }

    _this.checkAll = function(e) {
      e.preventDefault();

      $el.find('input').prop(checked, true)

      // Uncheck all of our checkboxes
      _this.getChecked().each(function(idx, el){
        $el.filter(':checkbox').prop(checked, true);
        $('.custom-checker').addClass(checked);
      });

      getDataBounce();
    }


    _this.uncheckAll = function(e) {
      e.preventDefault();


      $el.find('input').prop(checked, false)

      // Uncheck all of our checkboxes
      _this.getChecked().each(function(idx, el){
        $el.find('select').val('');

        $el.filter(':checkbox').removeAttr(checked);
        $('.custom-checker').removeClass(checked);
      });

      getDataBounce();

    }

    // Run initializer
    init();
  };

  // default settings
  $.ajax_formify.defaults = { };

  // our jQuery plugin magic.
  $.fn.ajax_formify = function(options){

    return this.each(function(idx, el) {
      var $el = $(el),
          key = 'pluginName';

      // Only create the plugin instance if it doesn't exist
      if (!$el.data(key)) {
        // Store plugin object in this element's data
        $el.data(key, new $.ajax_formify(el, $el, options));
      }

    });

  };

})(jQuery);
