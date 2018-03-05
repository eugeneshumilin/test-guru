class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  def index
    @questions = @test.questions
    render plain: @questions
  end

  def show
    render plain: @question.body
  end

  def create
    question = @test.questions.create(question_params)
    render plain: question.body
  end

  def destroy
    @question.destroy
    render plain: 'Question was destroyed'
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
