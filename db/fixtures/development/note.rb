Dir[Rails.root.join('db', 'fixtures', 'development', 'markdown', '*.md').to_s].each do |path|
  body = File.read path
  title = path.split('/').last.split('.').first
  Note.seed(:title) do |note|
    note.title = title
    note.body = body
  end
end
