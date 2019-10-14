require 'rails_helper'

feature 'User can log in' do

  scenario 'Existing registered user entering their correct details is logged in' do
    james = RegisteredUser.with_correct_login_details

    LogIn.as(james)

    expect(james).to be_notified_of_successful_login_on(the_page)
  end

end