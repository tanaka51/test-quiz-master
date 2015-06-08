App.module "Questions", (Questions) ->

  class Questions.Controller extends Marionette.Controller
    index: ->
      @collection = new Questions.Collection
      @view = new Questions.QuestionsView collection: @collection
      @collection.fetch()
      App.content.show(@view)

    new: ->
      @model = new Questions.Model
      @view = new Questions.EditQuestionView model: @model
      App.content.show(@view)

    show: (id) ->
      @model = new Questions.Model(id: id)
      @model.fetch().done =>
        @view = new Questions.QuestionView model: @model
        App.content.show(@view)

    edit: (id) ->
      @model = new Questions.Model(id: id)
      @model.fetch().done =>
        @view = new Questions.EditQuestionView model: @model
        App.content.show(@view)

  class Questions.Router extends Marionette.AppRouter
    appRoutes:
      "": "index"
      "questions/new": "new"
      "questions/:id": "show"
      "questions/:id/edit": "edit"

  Questions.addInitializer ->
    new Questions.Router controller: new Questions.Controller
