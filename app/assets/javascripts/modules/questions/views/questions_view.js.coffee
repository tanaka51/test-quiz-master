#= require ./questions_item_view

App.module "Questions", (Questions) ->

  class Questions.QuestionsView extends Marionette.CompositeView
    template: 'questions/templates/questions'
    childViewContainer: '.questions'
    childView: Questions.QuestionsItemView

    events:
      'click .new': 'new'

    new: (e) ->
      e.preventDefault()
      App.navigate "questions/new"
