class LookingToCreateAGallery < Actor
  def self.with_title(title)
    new OpenStruct.new(gallery_title: title)
  end

  def self.with_title_missing
    with_title ''
  end

  def has_a_gallery_called?(title)
    user.galleries.where(title: title).exists?
  end

  def has_any_galleries?
    user.galleries.any?
  end
end