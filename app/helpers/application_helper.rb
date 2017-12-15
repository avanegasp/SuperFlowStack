module ApplicationHelper
def markdown(text)
  options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
  syntax_highlighter(Redcarpet.new(text, *options).to_html).html_safe
end

def syntax_highlighter(html)
  doc = Nokogiri::HTML(html)
  doc.search("//pre[@lang]").each do |pre|
    pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
  end
  doc.to_s
end

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
