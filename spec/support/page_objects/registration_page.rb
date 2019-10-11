class RegistrationPage < Page
  def email=(email)
    fill_in 'Email', with: email
  end

  def password=(password)
    fill_in 'Password', with: password
  end

  def password_confirmation=(password_confirmation)
    fill_in 'Password confirmation', with: password_confirmation
  end

  def submit_registration
    click_button 'Register'
  end
end