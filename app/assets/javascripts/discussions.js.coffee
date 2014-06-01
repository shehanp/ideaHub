# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on "click", ".add-comment", ->
    $(@).parent().append().html('<textarea id="text" cols="20"></textarea>')
    false

  $(document).on "click", ".remove-comment", ->
    $(@).parents("p").fadeOut(1000)
    $(@).parents("p").find("input[type=hidden]").val("1")
    false