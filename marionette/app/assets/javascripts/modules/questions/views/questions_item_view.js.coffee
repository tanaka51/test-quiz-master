App.module "Questions", (Questions) ->

  class Questions.QuestionsItemView extends Marionette.ItemView
    template: 'questions/templates/questions_item'
    tagName: 'li'
    className: 'question'

    events:
      'click a.link': 'clickLink'
      'click a.edit': 'clickEdit'

    clickLink: (e) ->
      e.preventDefault()
      App.navigate "questions/#{@model.id}"

    clickEdit: (e) ->
      e.preventDefault()
      App.navigate "questions/#{@model.id}/edit"
