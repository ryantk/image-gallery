require 'rails_helper'

feature 'Users can create, edit and delete photo galleries' do

  scenario 'Logged in user creates new gallery' do
    alice = ALoggedInUser.who_is(LookingToCreateAGallery.with_title('My first gallery'))

    CreateANewGallery.as(alice)

    expect(alice).to have_a_gallery_called('My first gallery')
    expect(alice).to be_shown('My first gallery', on: the_page)
  end

  scenario 'Logged in user must enter a title to create a gallery' do
    ben = ALoggedInUser.who_is(LookingToCreateAGallery.with_title_missing)

    CreateANewGallery.as(ben)

    expect(ben).not_to have_any_galleries
  end

end