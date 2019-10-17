require 'rails_helper'

describe UploadPhoto do

  let(:gallery) { create(:gallery) }

  let(:temp_file) { fixture_file_upload(Rails.root.join('spec/fixtures/file/hollywood.jpg'), 'image/jpeg') }

  let(:upload_photo) { UploadPhoto.new(temp_file) }

  describe '#upload_and_attach_to' do
    before { upload_photo.upload_and_attach_to(gallery) }

    it 'saves the file to the storage folder' do
      photo_to_upload = Digest::SHA1.file temp_file.tempfile
      photo_on_server = Digest::SHA1.file Photo.upload_file_to_path(gallery.photos.first.filename)
      
      expect(photo_to_upload).to eq(photo_on_server)
    end

    it 'records details of the photo into a Photo object' do
      photo = gallery.photos.first
      expect(photo.original_filename).to eq('hollywood.jpg')
      expect(photo.uploaded_at).to within(1.second).of(DateTime.now)
    end

    it 'creates a resized thumbnail of the original image' do
      photo = gallery.photos.first
      thumbnail = MiniMagick::Image.open(Photo.upload_file_to_path(photo.thumbnail))
      expect(thumbnail.width).to eq(650)
    end
  end

end