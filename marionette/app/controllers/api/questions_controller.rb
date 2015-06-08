class Api::QuestionsController < ApplicationController
  before_filter :find_question, only: [:show, :update]

  def index
    @questions = Question.all
  end

  def create
    @question = Question.new question_params
    if @question.save
      render :show
    else
      render :show, status: :unprocessable_entity
    end
  end

  def update
    if @question.update_attributes question_params
      render :show
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.permit(:question, :answer)
  end
end
