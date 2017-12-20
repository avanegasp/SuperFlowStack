class VotesController < ApplicationController

  def create
    if params.key?("question_id")
      param_question = params[:question_id]
      if params[:vote][:type]=="sum"
        if is_user?(param_question,"question")
          cant_vote(param_question,"question","vote")
        else
          vote_question(param_question)
        end        
      else
        if is_user?(param_question,"question")
          delete_question_vote(param_question)
        else
          cant_vote(param_question,"question","delete")
        end
      end
   else
      param_answer = params[:answer_id]
      if params[:vote][:type]=="sum"
        if is_user?(param_answer,"answer")
          cant_vote(param_answer,"answer","vote")
        else
          vote_answer(param_answer)
        end
      else
        if is_user?(param_answer,"answer")
          delete_answer_vote(param_answer)
        else
          cant_vote(param_answer,"answer","delete")
        end
      end
    end
  end

  def cant_vote(param,type,action)
    if type == "question"
      @errors_votes_q = "You cant #{action} twice on this #{type}"
    else
      @errors_votes_a = "You cant #{action} twice on this #{type}"
    end
    if type == "question"
      @question = Question.find(param)
      render '/questions/show'
    else
      @question = Answer.find(param).question
      render '/questions/show'
    end
  end

  def is_user?(param,type)
    if type == "question"
      Question.find(param).votes.each do |vote|
        if vote.user_id == current_user.id
          return true
        end
      end
      return false
    else
      Answer.find(param).votes.each do |vote|
        if vote.user_id == current_user.id
          return true
        end
      end
      return false
    end
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
