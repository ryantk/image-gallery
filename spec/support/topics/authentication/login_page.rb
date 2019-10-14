class LoginPage < Page
  def navigate_to
    visit '/'
    click_link 'Log in'
  end

  def email=(email)
    fill_in 'Email', with: email
  end

  def password=(password)
    fill_in 'Password', with: password
  end

  def submit_login
    click_button 'Log in'
  end
end