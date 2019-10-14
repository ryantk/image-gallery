require 'rails_helper'

feature 'Users can create, edit and delete photo galleries' do

  scenario 'Logged in user creates new gallery' do
    alice = GalleryUser.who_is_logged_in

    CreateANewGallery.with_title('My first gallery')

    expect(alice).to have_a_gallery_called('My first gallery')
    expect(alice).to be_shown('My first gallery', on: the_page)
  end

  scenario 'Logged in user must enter a title to create a gallery' do
    ben = GalleryUser.who_is_logged_in

    CreateANewGallery.with_title('')

    expect(ben).not_to have_any_galleries
  end

  scenario 'Logged in user can delete an existing gallery' do
    tara = GalleryUser.with_an_existing_gallery_named('1st Birthday').who_is_logged_in

    DeleteAGallery.with_title('1st Birthday')

    expect(tara).not_to have_a_gallery_called('1st Birthday')
  end

end