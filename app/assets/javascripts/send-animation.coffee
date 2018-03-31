document.addEventListener "turbolinks:load", () ->

  request = (class_css)->
    btn = $(".input-group-newsletter").find 'button'
    max_x = $(".input-group-newsletter").width()
    max_y = $(".input-group-newsletter").height()
    
    btn.animate({width:max_x+3,height:max_y,marginRight: "-=3px"})
    $(btn).find('span').hide()
    $(".loading-gif").hide()

    btn.addClass class_css
    
    $(btn).off().on 'click', ()->
      window.location.href=window.location.href


  $('form').on('ajax:success', (e, data, status, xhr) ->
    request 'js-btn-animate sendok'
  ).on 'ajax:error', (e, xhr, status, error) ->
    request 'js-btn-animate sender'



  $(".send-btn").on 'click', ()->
    email = $('#message_email').val()
    regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/

    if regex.test(email)
      # html5 - clear popup error 
      $('#message_email').get(0).setCustomValidity ''

      $(this).find('span').css 'opacity', '0'
      $(".loading-gif").show()
    else
      # html5 - show popup error 
      $('#message_email').get(0).setCustomValidity $('#validation-email-popup-text').val()