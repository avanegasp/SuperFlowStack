class VotesController < ApplicationController

  def create
    if params.key?("question_id")
      param_question = params[:question_id]
      if params[:vote][:type]=="sum"

        if is_user?(param_question)
          cant_vote(param_question,"question")
        
        else
          vote_question(param_question)
        end        
      else
        delete_question_vote(param_question)
      end
   else
      param_answer = params[:answer_id]
      if params[:vote][:type]=="sum"
        vote_answer(param_answer)
      else
        delete_answer_vote(param_answer)
      end
    end
  end

  def cant_vote(param,type)
    @errors = "You cant vote twice on this #{type}"
    if type == "question"
      @question = Question.find(param)
      render '/questions/show'
    else
      @question = Answer.find(param_answer).question
      render '/questions/show'
    end
  end

  def is_user?(param_question)
    Question.find(param_question).votes.each do |vote|
      if vote.user_id == current_user.id
        return true
      end
    end
    return false
  end

  def vote_question(param_question)
    @vote = Question.find(param_question).votes.new(user_id: current_user.id)
    if @vote.save
      redirect_to question_path(param_question)
    else
      @errors_vote_que = @vote.errors.full_messages
      @question = Question.find(param_question)
      render '/questions/show'
    end
  end

  def vote_answer(param_answer)
    @vote = Answer.find(param_answer).votes.new(user_id: current_user.id)
    if @vote.save
      redirect_to question_path(Answer.find(param_answer).question.id)
    else
        @errors_vote_ans = @vote.errors.full_messages
        @question = Answer.find(param_answer).question
      render '/questions/show'
    end
  end

  def delete_question_vote(param_question)
    Question.find(param_question).votes.first.destroy
      @question = Question.find(param_question)
      render '/questions/show'
  end

  def delete_answer_vote(param_answer)
    Answer.find(param_answer).votes.first.destroy
    @question = Answer.find(param_answer).question
    render '/questions/show'
  end
end
