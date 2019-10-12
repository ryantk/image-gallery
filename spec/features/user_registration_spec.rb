require 'rails_helper'

feature 'Visiting user can register for an account' do

  scenario 'Registering with a correct email and password creates a new account successfully' do
    ryan = UserLookingToRegister.with_valid_details

    RegisterForAnAccount.as(ryan)

    expect(ryan).to have_an_account_created
  end

  scenario 'Registering with invalid details shows an error' do
    jenny = UserLookingToRegister.with_invalid_email_and_missing_password

    RegisterForAnAccount.as(jenny)

    expect(the_page).to have_error('Email is invalid')
    expect(the_page).to have_error("Password can't be blank")
    expect(jenny).not_to have_an_account_created
  end

end