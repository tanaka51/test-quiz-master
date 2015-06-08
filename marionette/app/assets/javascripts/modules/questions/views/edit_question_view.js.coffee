App.module "Questions", (Questions) ->

  class Questions.EditQuestionView extends Marionette.ItemView
    template: 'questions/templates/edit_question'

    ui:
      alert: '.alert'
      question: 'input[name=question]'
      answer: 'input[name=answer]'

    events:
      'submit form': 'submit'

    modelEvents:
      error: 'modelError'
      sync: 'modelSync'

    submit: (e) ->
      e.preventDefault()
      @model.save
        question: @ui.question.val()
        answer: @ui.answer.val()

    modelError: ->
      @ui.alert.text("There was an error saving your question.")
      @ui.alert.removeClass('hide')

    modelSync: ->
      App.navigate "/"
