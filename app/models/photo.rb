class Photo
  include Mongoid::Document

  field :filename, type: String
  field :original_filename, type: String
  field :thumbnail, type: String
  field :uploaded_at, type: DateTime

  embedded_in :gallery


  def self.upload_file_to_path(filename)
    Pathname.new(Rails.configuration.uploads['save_path']).join(filename)
  end

  def self.access_file_url_path(filename)
    "#{Rails.configuration.uploads[:url_path]}/#{filename}"
  end
end