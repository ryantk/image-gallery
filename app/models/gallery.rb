class Gallery
  include Mongoid::Document

  field :title, type: String
  
  belongs_to :user
  embeds_many :photos

  validates_presence_of :title
  

  def upload_photo(temp_file)
    photo = UploadPhoto.new(temp_file)
    photo.upload_and_attach_to(self)
  end
end