require 'rails_helper'

feature 'Users can upload and delete photos' do

  scenario 'User can upload a photo into a gallery' do
    frankie = GalleryUser.with_an_existing_gallery_named('Hollywood trip').who_is_logged_in

    VisitGallery.named('Hollywood trip')
      .and_upload(Rails.root.join('spec/fixtures/file/hollywood.jpg'))

    expect(frankie).to be_shown_photo('hollywood.jpg')
  end

end