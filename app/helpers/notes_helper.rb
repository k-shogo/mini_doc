module NotesHelper
  @@renderer = Redcarpet::Render::HTML.new filter_html: true, hard_wrap: true

  @@markdown = Redcarpet::Markdown.new @@renderer,
    autolink:            true,
    space_after_headers: true,
    no_intra_emphasis:   true,
    fenced_code_blocks:  true,
    tables:              true,
    xhtml:               true,
    lax_html_blocks:     true,
    strikethrough:       true

  def markdown(text)
    @@markdown.render(text).html_safe
  end
end
