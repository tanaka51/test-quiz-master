class Application extends Backbone.Marionette.Application
  onStart: ->
    @addRegions(content: '#content')
    @startRouting()

  startRouting: ->
    Backbone.history.start(pushState: Modernizr.history, silent: true)
    @load(Backbone.history.getFragment())

  # Navigates to a URL
  navigate: (path, options = {}) ->
    Backbone.history.navigate(path, _.extend({trigger: true}, options))

  # Loads and displays a URL without any navigation.
  load: (path) ->
    Backbone.history.loadUrl(path)

window.App = new Application()

$ ->
  App.start()
