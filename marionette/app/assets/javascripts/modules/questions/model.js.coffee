App.module "Questions", (Questions) ->

  class Questions.Model extends Backbone.Model
    urlRoot: "/api/questions"
    defaults:
      question: ''
      answer: ''

  class Questions.Collection extends Backbone.Collection
    model: Questions.Model
    url: "/api/questions"
