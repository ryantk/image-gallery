require 'rails_helper'

feature 'Visiting user can register for an account' do

  scenario 'Registering with a correct email and password creates a new account successfully' do
    ryan = UserLookingToRegister.with_valid_details

    RegisterForAnAccount.as(ryan)

    expect(a_new_user_account).to have_been_created_for(ryan)
  end

  scenario 'Registering with invalid details shows an error' do
    jenny = UserLookingToRegister.with_invalid_email_and_missing_password

    RegisterForAnAccount.as(jenny)

    expect(the_page).to have_error('Email is invalid')
    expect(the_page).to have_error("Password can't be blank")
    expect(a_new_user_account).not_to have_been_created_for(jenny)
  end

end