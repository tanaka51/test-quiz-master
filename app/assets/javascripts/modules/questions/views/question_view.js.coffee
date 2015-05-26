App.module "Questions", (Questions) ->

  class Questions.QuestionView extends Marionette.ItemView
    template: 'questions/templates/question'

    ui:
      alert: '.alert'

    events:
      'submit form': 'submit'

    submit: (e) ->
      e.preventDefault()
      @ui.alert.text("I don't know if you got it right. Sorry.")
      @ui.alert.removeClass('hide')
