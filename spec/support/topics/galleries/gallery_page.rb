class GalleryPage < Page
  def upload_photo(photo_path)
    attach_file 'file', photo_path
  end

  def submit
    click_button 'Upload'
  end
end