require 'rails_helper'


# 
#  <ActionDispatch::Http::UploadedFile:0x00007ff7138bd9b0 
#  @tempfile=#<Tempfile:/var/folders/zc/nrgwhs816lv0yqtgk8s40mnw0000gp/T/RackMultipart20191016-43836-1pcib96.png>, 
#  @original_filename="xmas card grace.png", 
#  @content_type="image/png", 
#  @headers="Content-Disposition: form-data; name=\"file\"; filename=\"xmas card grace.png\"\r\nContent-Type: image/png\r\n">

describe UploadPhoto do

  let(:gallery) { Gallery.new }

  let(:temp_file) {
    mock(
      tempfile: File.open(Rails.root.join('fixtures/hollywood.jpg')),
      original_filename: 'hollywood.jpg',
      content_type: 'image/jpeg'
    )
  }

  let(:upload_photo) { UploadPhoto.new(temp_file) }


  describe '#upload_and_attach_to' do
    it 'saves the file to the storage folder' do
      upload_photo.upload_and_attach_to(gallery)

      photo_to_upload = temp_file.tempfile
      photo_on_server = File.open(gallery.photos.first.file_path)

      expect(photo_to_upload).to eq(photo_on_server)
    end
  end

end