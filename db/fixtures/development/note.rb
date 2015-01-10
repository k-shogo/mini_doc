created_at = Time.current
repeat = 30
Dir[Rails.root.join('db', 'fixtures', 'development', 'markdown', '*.md').to_s].each do |path|
  body = File.read path
  title = path.split('/').last.split('.').first
  repeat.times do |r|
    Note.seed(:title) do |note|
      note.title = "#{title} #{r}"
      note.body = body
      note.created_at = created_at
      created_at = created_at.ago rand(600) * 60
    end
  end
end
