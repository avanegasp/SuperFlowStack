class QuestionsController < ApplicationController
   before_action :authenticate_user! , only: [:new]

  def index
    @questions = Question.all
  end

  def new
  	@question = Question.new
  end

  def create
    @question = current_user.questions.create(valid_params)
    if @question.save
      redirect_to question_path(@question.id)
    else
      puts current_user
      render :new
  end
end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  private
    def valid_params()
    params.require(:question).permit(:title, :description)
  end
end
