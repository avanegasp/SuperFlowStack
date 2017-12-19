module ApplicationHelper
  def markdown(text)
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    md = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    syntax_highlighter(md.render(text)).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end
end

# module ApplicationHelper
#   def markdown(text)
#     options = {
#       filter_html:     true,
#       hard_wrap:       true,
#       link_attributes: { rel: 'nofollow', target: "_blank" },
#       space_after_headers: true,
#       fenced_code_blocks: true
#     }
#
#     extensions = {
#       autolink:           true,
#       superscript:        true,
#       disable_indented_code_blocks: true
#     }
#
#     renderer = Redcarpet::Render::HTML.new(options)
#     markdown = Redcarpet::Markdown.new(renderer, extensions)
#
#     markdown.render(text).html_safe
# end
# end

# def syntax_highlighter(html)
#   doc = Nokogiri::HTML(html)
#   doc.search("//pre[@lang]").each do |pre|
#     pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
#   end
#   doc.to_s
# end
#
# def create_vote(param_question)
# 	@vote = Question.find(param_question).votes.new(user_id: current_user.id)
#         if @vote.save
#           redirect_to question_path(param_question)
#         else
#           @errors_vote_que = @vote.errors.full_messages
#           @question = Question.find(param_question)
#
#         end
# end
# end
