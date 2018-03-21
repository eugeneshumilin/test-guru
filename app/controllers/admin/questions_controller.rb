class Admin::QuestionsController < ApplicationController
  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[show destroy edit update]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def edit; end

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.build(question_params)

    if @question.save
      redirect_to [:admin, @question]
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to [:admin, @question]
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to [:admin, @question.test], notice: 'Question was destroyed'
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

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
