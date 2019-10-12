require 'rails_helper'

feature 'User can log in' do

  scenario 'Existing registered user entering their correct details is logged in' do
    james = RegisteredUser.with_correct_login_details

    LogIn.as(james)

    expect(the_page).to be_showing_user_as_logged_in
  end

end