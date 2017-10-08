pageLoad = ->
  className = $('body').attr('data-class-name')

  if className == undefined
    className = "Views.ApplicationView"

  initializePage(className)
  initializePageBase(className)

initializePage = (className) ->
  window.applicationView = try
    eval("new #{className}()")
  catch error
    new Views.ApplicationView()

  window.applicationView.render()

initializePageBase = (className) ->
  modules = className.split('.')
  modules.splice(modules.length - 1, 1)

  window.baseView = try
    eval("new #{modules.join('.')}.BaseView")

  window.baseView.render() unless window.baseView is undefined

$(document).on 'turbolinks:load', pageLoad # turbolinks:load is master branch of turbolinks, if you are using older version, it's page:load
$(document).on 'page:before-change', ->
  window.applicationView.cleanup()
  true
$(document).on 'page:restore', ->
  window.applicationView.cleanup()
  pageLoad()
  true
