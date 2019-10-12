class RegisteredUser < Actor
  def self.with_correct_login_details
    new create(:user)
  end

  def notified_of_successful_login_on?(page)
    page.has_message?('Signed in successfully')
  end
end