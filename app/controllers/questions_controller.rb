class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    puts Question.first.title
  end

end
