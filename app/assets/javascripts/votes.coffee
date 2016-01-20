# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#vote_value_5').on 'click', (e) ->
    if $(this).is(':checked')
      $('#rating-warning').css 'display', 'none'
    else
      $('#rating-warning').css 'display', 'block'
    return
  $('#vote_value_4').on 'click', (e) ->
    if $(this).is(':checked')
      $('#rating-warning').css 'display', 'block'
    return
  $('#vote_value_3').on 'click', (e) ->
    if $(this).is(':checked')
      $('#rating-warning').css 'display', 'block'
    return
  $('#vote_value_2').on 'click', (e) ->
    if $(this).is(':checked')
      $('#rating-warning').css 'display', 'block'
    return
  $('#vote_value_1').on 'click', (e) ->
    if $(this).is(':checked')
      $('#rating-warning').css 'display', 'block'
    return
