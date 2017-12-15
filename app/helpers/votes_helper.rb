module VotesHelper

def create_vote(param_question)
	@vote = Question.find(param_question).votes.new(user_id: current_user.id)
        if @vote.save
          redirect_to question_path(param_question)
        else
          @errors_vote_que = @vote.errors.full_messages
          @question = Question.find(param_question)

        end
    end

end
