class LookingToCreateAGallery < Actor
  def self.with_title(title)
    new OpenStruct.new(gallery_title: title)
  end

  def has_a_gallery_called?(title)
    Gallery.where(title: title).exists?
  end
end