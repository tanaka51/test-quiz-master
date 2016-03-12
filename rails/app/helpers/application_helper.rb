module ApplicationHelper
  def markdown(words)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    markdown = Redcarpet::Markdown.new(renderer, autolink: true)
    markdown.render(words).html_safe
  end
end
