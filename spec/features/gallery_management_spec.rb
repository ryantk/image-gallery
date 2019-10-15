require 'rails_helper'

feature 'Users can create, edit and delete photo galleries' do

  scenario 'Non logged in users cannot create a new gallery' do
    gerald = GalleryUser.who_is_not_logged_in

    expect { CreateANewGallery.with_title('My first gallery') }.to raise_error
    expect(gerald).not_to have_any_galleries
  end

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

  scenario 'Logged in user can edit their own gallery' do
    jack = GalleryUser.with_an_existing_gallery_named('Best photos').who_is_logged_in

    EditGallery.with_title('Best photos').change_title_to('Best Ever Photos')

    expect(jack).to have_a_gallery_called('Best Ever Photos')
    expect(jack).not_to have_a_gallery_called('Best photos')
  end

  scenario 'Logged in user cannot edit another users galleries' do
    becky = GalleryUser.with_an_existing_gallery_named('Dont touch')
    ashley = GalleryUser.who_is_logged_in

    expect { EditGallery.with_title('Dont touch').change_title_to('I have changed it') }.to raise_error
    expect(becky).to have_a_gallery_called('Dont touch')
    expect(becky).not_to have_a_gallery_called('I have changed it')
  end

end