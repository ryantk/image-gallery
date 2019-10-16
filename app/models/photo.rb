class Photo
  include Mongoid::Document

  field :filename, type: String
  field :uploaded_at, type: DateTime
  field :file_path, type: String
  field :thumbnail_file_path, type: String

  embedded_in :gallery
end