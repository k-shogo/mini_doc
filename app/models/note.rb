class Note < ActiveRecord::Base
  include Redis::Objects
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  counter :views

  index_name [Rails.application.class.parent_name.downcase, Rails.env, self.name.tableize].join('_')

  mapping do
    indexes :title,      index: :analyzed, analyzer: :kuromoji
    indexes :body,       index: :analyzed, analyzer: :kuromoji
    indexes :created_at, type:  :date
    indexes :updated_at, type:  :date
  end

end
