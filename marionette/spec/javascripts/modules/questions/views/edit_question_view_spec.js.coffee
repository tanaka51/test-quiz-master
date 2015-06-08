#= require spec_helper

describe 'Questions.EditQuestionView', ->
  beforeEach ->
    @model = new App.Questions.Model id: 1, question: 'Hello', answer: 'Goodbye'
    @view = new App.Questions.EditQuestionView model: @model
    @view.render()

  it 'shows question', ->
    expect(@view.ui.question.val()).to.eq 'Hello'

  it 'shows answer', ->
    expect(@view.ui.answer.val()).to.eq 'Goodbye'

  describe 'submit', ->
    beforeEach ->
      @sinon.stub @model, 'save'
      @view.ui.question.val 'Hello New'
      @view.ui.answer.val 'Goodbye New'
      @view.$('form').submit()

    it 'saves the changes', ->
      expect(@model.save.calledWith(question: 'Hello New', answer: 'Goodbye New')).to.be.true

  describe 'error', ->
    beforeEach ->
      @model.trigger 'error'

    it 'shows error message', ->
      expect(@view.ui.alert.text()).to.include "an error"
      expect(@view.ui.alert.hasClass('hide')).to.be.false

  describe 'sync', ->
    beforeEach ->
      @sinon.stub App, 'navigate'
      @model.trigger 'sync'

    it 'redirects', ->
      expect(App.navigate.calledWith('/')).to.be.true
