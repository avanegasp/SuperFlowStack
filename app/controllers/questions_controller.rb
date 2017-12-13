class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    puts Question.first.title
  end

  def new
  	@question = Question.new
  end

end
