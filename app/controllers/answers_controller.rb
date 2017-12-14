class AnswersController < ApplicationController

  def create
    puts '*'* 50
    puts params
     question = valid_params_ans

     puts valid_params_ans
     puts question
     @answer = Question.find(question[:question_id]).answers.create(valid_params_ans)
     puts valid_params_ans
     if @answer.save
       redirect_to question_path(question[:question_id])
     else
       puts @answer.errors.full_messages
       redirect_to question_path(question[:question_id])
     end

    # puts valid_params_ans

  end

  private
  def valid_params_ans
    params.require(:answer).permit(:description).merge(user_id: current_user.id, question_id: params[:question_id])
  end
end
