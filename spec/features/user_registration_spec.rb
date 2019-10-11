require 'rails_helper'

feature 'Visiting User can register for an account' do

  scenario 'User entering correct email and password has account created' do
    ryan = UserLookingToRegister.with_valid_details

    RegisterForAnAccount.as(ryan)

    expect(NewUserAccount).to have_been_created_for(ryan)
  end

end