#= require spec_helper

describe 'Questions.Controller', ->
  beforeEach ->
    @controller = new App.Questions.Controller

  describe 'index', ->
    beforeEach ->
      @sinon.stub App.Questions.Collection::, 'fetch', -> $.Deferred().resolve()
      @controller.index()

    it 'sets up view', ->
      expect(@controller.view).to.be.an.instanceof App.Questions.QuestionsView
      expect(@controller.view.collection).to.be.an.instanceof App.Questions.Collection

    it 'fetches', ->
      expect(@controller.collection.fetch).to.have.been.called

    it 'shows questions view', ->
      expect(App.content.currentView).to.eq @controller.view

  describe 'show', ->
    beforeEach ->
      @sinon.stub App.Questions.Model::, 'fetch', -> $.Deferred().resolve()
      @controller.show()

    it 'sets up view', ->
      expect(@controller.view).to.be.an.instanceof App.Questions.QuestionView
      expect(@controller.view.model).to.be.an.instanceof App.Questions.Model

    it 'fetches', ->
      expect(@controller.model.fetch).to.have.been.called

    it 'shows question view', ->
      expect(App.content.currentView).to.eq @controller.view

  describe 'edit', ->
    beforeEach ->
      @sinon.stub App.Questions.Model::, 'fetch', -> $.Deferred().resolve()
      @controller.edit(1)

    it 'sets up view', ->
      expect(@controller.view).to.be.an.instanceof App.Questions.EditQuestionView
      expect(@controller.view.model).to.be.an.instanceof App.Questions.Model

    it 'sets up model', ->
      expect(@controller.model.id).to.eq 1

    it 'fetches', ->
      expect(@controller.model.fetch).to.have.been.called

    it 'shows question view', ->
      expect(App.content.currentView).to.eq @controller.view

  describe 'new', ->
    beforeEach ->
      @sinon.stub App.Questions.Model::, 'fetch'
      @controller.new()

    it 'sets up view', ->
      expect(@controller.view).to.be.an.instanceof App.Questions.EditQuestionView
      expect(@controller.view.model).to.be.an.instanceof App.Questions.Model

    it 'does not fetch', ->
      expect(@controller.model.fetch).not.to.have.been.called

    it 'shows edit question view', ->
      expect(App.content.currentView).to.eq @controller.view
