# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

highlight = () ->
  $('td.code').each (i, e) => 
    hljs.highlightBlock(e, null, true);

$(document).ready ->
  highlight()

$(document).on 'page:change', ->
  highlight()
