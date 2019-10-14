class RegisteredUser < Actor
  def self.with_correct_login_details
    new create(:user)
  end

  def self.who_is_logged_in
    new(create(:user)).who_is_logged_in
  end

  def who_is_logged_in
    login_as(self)
    self
  end

  def notified_of_successful_login_on?(page)
    page.has_message?('Signed in successfully')
  end
end