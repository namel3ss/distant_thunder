window.Views ||= {}
class Views.ApplicationView

 render: ->
   # common javascript code
   # TODO: Do I need this loader?
  $('#status').fadeOut('slow')
  $('#preloader').delay(500).fadeOut('slow').remove()

 cleanup: ->
   # common javascript cleanup code
