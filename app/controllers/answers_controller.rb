class AnswersController < ApplicationController
  def create
     question = valid_params_ans
     @answer = Question.find(question[:question_id]).answers.new(valid_params_ans)
     if @answer.save
       redirect_to question_path(question[:question_id])
     else
       @errors_answer = @answer.errors.full_messages
       @question = @answer.question
       @question.reload

       render '/questions/show'
     end
  end

  private
  def valid_params_ans
    params.require(:answer).permit(:description).merge(user_id: current_user.id, question_id: params[:question_id])
  end
end
