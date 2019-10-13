require 'rails_helper'

feature 'Users can create, edit and delete photo galleries' do

  let(:jane) { 
    Actor.named('Jane')
      .who_can(Authenticate.with_correct_details) 
  }

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

  scenario 'User with existing gallery may delete it' do
    jane.will(StartWithAnExistingGallery.called('My existing gallery'))

    jane.attempts_to(DeleteAGallery.called('My existing gallery'))

    expect(jane).not_to see_any(Galleries.listed)
  end

end