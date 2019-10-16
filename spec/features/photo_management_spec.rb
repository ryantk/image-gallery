require 'rails_helper'

feature 'Users can upload and delete photos' do

  scenario 'User can upload a photo into a gallery' do
    frankie = GalleryUser.with_an_existing_gallery_named('Hollywood trip').who_is_logged_in

    visit '/'
    click_link 'Hollywood trip'
    attach_file 'Add photo to gallery', Rails.root.join('spec/fixtures/hollywood.png')
    click_button 'Upload'

  end

end