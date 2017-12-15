class CommentsController < ApplicationController
  def edit
  end

  def create
  	if params.key?("question_id")
	  	param_question = params[:question_id]
	  	@comment = Question.find(param_question).comments.new(valid_params_comments)
	  	if @comment.save
	  		redirect_to question_path(param_question)
	  	else
	  		@errors_comment_que = @comment.errors.full_messages
	  		@question = Question.find(param_question)
	  		render '/questions/show'
	  	end
	 else

		param_answer = params[:answer_id]
	  	@comment = Answer.find(param_answer).comments.new(valid_params_comments)
	  	if @comment.save
	  		redirect_to question_path(Answer.find(param_answer).question.id)
	  	else
        	@errors_comment_ans = @comment.errors.full_messages
        	@question = Answer.find(param_answer).question

        render '/questions/show'
	  		# redirect_to question_path(Answer.find(param_answer).question.id)
	  	end
	  end
end

  def delete
  end

  def update
  end

  private
  def valid_params_comments
  	params.require(:comment).permit(:description).merge(user_id: current_user.id)

  end
end
