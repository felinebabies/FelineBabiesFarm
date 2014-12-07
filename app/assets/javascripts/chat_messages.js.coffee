# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('.chat_messages.index').ready ->
    setInterval () ->
        $.getScript '/chat_messages/update.js'
    , 5000
