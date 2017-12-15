class VotesController < ApplicationController
  def index
  end

  def show
  end

  def create
    if params.key?("question_id")
      param_question = params[:question_id]
      @vote = Question.find(param_question).votes.new(user_id: current_user.id)
        if @vote.save
          redirect_to question_path(param_question)
        else
          @errors_vote_que = @vote.errors.full_messages
          @question = Question.find(param_question)
          render '/questions/show'
        end
   else

    param_answer = params[:answer_id]
      @vote = Answer.find(param_answer).votes.new(user_id: current_user.id)
      if @vote.save
        redirect_to question_path(Answer.find(param_answer).question.id)
      else
          @errors_vote_ans = @vote.errors.full_messages
          @question = Answer.find(param_answer).question

        render '/questions/show'
        # redirect_to question_path(Answer.find(param_answer).question.id)
      end
    end
  end

  def new
  end

  def edit
  end
end
