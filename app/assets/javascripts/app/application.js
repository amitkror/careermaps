var APP = (function($, undefined) {
  'use strict';

  var app = {},
      $el,
      $win = $(window),
      $tabbedForm,
      $hasSubNav,
      $formFilter,
      $quizLink;

  app.isMobile = function() {
    return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
  };

  function init() {
    $(document).on('page:change', setupPage);

    // Set up the global ajax
    $.ajaxSetup({
      cache: false,
      error: function(x, e) {
        if (typeof console !== 'undefined') {
          console.log('error', x, e);
        }
      },
      type: 'POST'
    });

    setupPage();

  }

  $(".style_image").click(function(){
    if($(this).attr('alt') == 'hot'){
      $("#hot_industry").click();
    }else if($(this).attr('alt') == 'cer'){
      $("#needs_certification").click();
    }else{ 
      var cid = $(this).attr('alt'); 
      $("#careers_"+cid).click();
    }
  });

  $(".style_image_el").click(function(){
    if($(this).attr('alt') == 'hot'){
      $("#hot_industry").click();
    }else if($(this).attr('alt') == 'cer'){
      $("#needs_certification").click();
    }else{ 
      var cid = $(this).attr('alt'); 
      $("#el_"+cid).click();
    }
  });

  //closes the main mobile menu on html click
  function closeMenu() {
    $('.main-nav').removeClass('on');
    $('.mobile-nav').add('html').off('click', closeMenu);
  }

  function formValidation($el) {
    $el.bind('change', function() {
      var inputs = $el.find('.answers input').serializeArray(),
          $errors = $('.errors'),
          $button = $('button.red'),
          $button_wrap = $('.button-wrap');

      if(inputs.length === 4) {
        // $errors.animate('opacity', 0).remove();
        $button.removeClass('disabled');
        $button.attr('disabled', false);
      } else {
        $button.addClass('disabled');
      }
    }).trigger('change');
  }

  function onQuizClick(e) {
    e.preventDefault();
    var $targ = $(this).offset().top;

    scroll($targ);
  }

  function onQuizReturn(e) {
    var str = window.location.hash,
        n = str.replace('_temp', '');

    if (n === "#quiz-link") {
      var $targ = $(n).offset().top;
      scroll($targ);
    }
  }

  //responsive main menu
  function openMenu(e) {
    e.preventDefault();

    $('.main-nav')
      .on('click', stop)
      .addClass('on');
    $('.mobile-nav').add('html').on('click', closeMenu);

  }

  function open(e) {
    var href = this.getAttribute('href');
    // If we're linking to a different domain, stop the normal behavior and open in a new window.
    if (window.location.host !== href.split('/')[2]) {
      e.preventDefault();
      window.open(href);
    }
  }

  function resize() {
    if (app.isMobile() || $win.width() < 768) {
      $hasSubNav.click(slideSubMenu);
      $formFilter.trigger('click');

      $('.mobile-nav').click(openMenu);
    } else if ($win.width() > 768 ){
      if ($('.has-subnav').hasClass('on')) {
        slideOff();
      }
    }
  }

  function setupPage() {
    $formFilter = $('.clear-boxes'),
    $tabbedForm = $('.tabbed-form');
    $quizLink = $('.quiz-link');
    $hasSubNav = $('.has-subnav span');

    $('a[href=#]').attr('href', 'javascript:;');

    // Open links starting with "http(s)://" in a new window unless they're targeted at this host.
    $("a[href^=http]")
      .off('click', open)
      .on('click', open);

    //ui changes
    $('input.custom').customCheck();
    $('select.custom-select').customSelect();

    //trying to make ajax forms work as a plugin
    $('#search-jobs').ajax_formify();
    $('#search-careers').ajax_formify();


    //tabular
    $tabbedForm.tabs();

    //form validation
    formValidation($('#search-jobs-search'))

    //scroll on homepage
    $quizLink.click(onQuizClick);

    onQuizReturn();

    if (!Modernizr.input.placeholder) {
      placeholder();
    }

    var resizeBounce = debounce(resize, 500);
    $(window).on('resize', resizeBounce);
    resize();
  }


  function placeholder() {
    var attr = 'placeholder';
    $('input[' + attr + '!=""]').each(function(idx, el){
      $el = $(el);
      var d = $el.attr(attr);
      if (d === undefined || $el.attr('type') === 'password') { return; }
      $el
        .focus(function onFocus() {
          $(this).removeClass(attr);
          if (this.value === d) { this.value = ''; }
        })
        .blur(function onBlur() {
          if ($.trim(this.value) === '') {
            $(this).addClass(attr);
            this.value = d;
          }
        }).blur();
    });
  }

  function scroll($el) {
    $('html, body')
      .stop()
      .animate({
        scrollTop: $el + 125
      }, 400);

      return false;
  }

  function slideOff() {
    $('.has-subnav').removeClass('on');
    $('.back').add('html').off('click', slideOff);
  }


  function slideSubMenu(e) {
    e.preventDefault();

    $('.has-subnav')
      .on('click', stop)
      .addClass('on');

    $('.back').add('html').on('click', slideOff);
  }

  // A function to stop the click event from bubbling to the html element.
  function stop(e) {
    e.stopPropagation();
  }

  // Call the init function on load
  $(init);
  return app;
} (jQuery));
