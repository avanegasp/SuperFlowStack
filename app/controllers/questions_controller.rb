class QuestionsController < ApplicationController
   before_action :authenticate_user! , only: [:new]

  def index
  	
  	puts "*"*100
  	@questions = Question.all
  	if params[:query].present?
  		@questions = @questions.where("title LIKE :query", query: "%#{params[:query]}%")
  	end
  	puts "+"*100
  	puts @questions
  	puts "+"*100
  	render "index"
  end

  def new
  	@question = Question.new
  end

  def create
    @question = current_user.questions.create(valid_params)
    if @question.save
      redirect_to question_path(@question.id)
    else
    	puts @question.errors.full_messages
      @errors = @question.errors.full_messages
      puts current_user
      render :new
  end
end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(valid_params)
      redirect_to question_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end

  private
    def valid_params()
    params.require(:question).permit(:title, :description)
  end
end
