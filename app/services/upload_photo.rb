class UploadPhoto
  def initialize(uploaded_file)
    @uploaded_file = uploaded_file
  end

  def upload_and_attach_to(gallery)
    File.binwrite(main_upload_file_path, uploaded_file.read)
    make_thumbnail

    gallery.photos.create(
      original_filename: uploaded_file.original_filename,
      filename: main_upload_filename,
      thumbnail: thumbnail_filename,
      uploaded_at: DateTime.now
    )
  end

  private
  attr_reader :uploaded_file

  def main_upload_file_path
    Photo.upload_file_to_path(main_upload_filename)
  end

  def main_upload_filename
    @main_upload_filename ||= generate_filename
  end

  def thumbnail_file_path
    Photo.upload_file_to_path(thumbnail_filename)
  end

  def thumbnail_filename
    @thumbnail_filename ||= generate_filename
  end

  def generate_filename
    "#{SecureRandom.uuid}#{File.extname(uploaded_file.original_filename)}"
  end

  def make_thumbnail
    image = MiniMagick::Image.open(uploaded_file.tempfile.path)
    image.resize "650x650"
    image.write thumbnail_file_path
  end
end