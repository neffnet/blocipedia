module ApplicationHelper
  def markdown_to_html(markdown)
  renderer = Redcarpet::Render::HTML.new
  extensions = {no_intra_emphasis: true, fenced_code_blocks: true, autolink: true, superscript: true, underline: true }
  redcarpet = Redcarpet::Markdown.new(renderer,extensions)
  (redcarpet.render markdown).html_safe
  end
end
