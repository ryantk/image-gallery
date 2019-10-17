module GalleryHelper

  def showcase_image_src(gallery)
    gallery.photos.any? ? gallery_thumbnail_src(gallery.photos.first) : 'http://via.placeholder.com/640x360'
  end

  def gallery_image(photo)
    link_to gallery_photo_src(photo) do
      image_tag gallery_thumbnail_src(photo), class: 'card-img-top'
    end
  end

  def gallery_thumbnail_src(photo)
    Photo.access_file_url_path(photo.thumbnail)
  end

  def gallery_photo_src(photo)
    Photo.access_file_url_path(photo.filename)
  end

end