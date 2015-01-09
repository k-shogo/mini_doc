# need to be required to use Rouge with Redcarpet
require 'rouge/plugins/redcarpet'

class HTML < Redcarpet::Render::HTML
  # to use Rouge with Redcarpet
  include Rouge::Plugins::Redcarpet
  # overriding Redcarpet method
  # github.com/vmg/redcarpet/blob/master/lib/redcarpet/render_man.rb#L9
  def block_code(code, language)
    # highlight some code with a given language lexer 
    # and formatter: html or terminal256 
    # and block if you want to stream chunks
    # github.com/jayferd/rouge/blob/master/lib/rouge.rb#L17
    Rouge.highlight(code, language || 'text', 'html') 
    # watch out you need to provide 'text' as a default, 
    # because when you not provide language in Markdown 
    # you will get error: <RuntimeError: unknown lexer >
  end
end
