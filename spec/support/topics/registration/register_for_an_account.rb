class RegisterForAnAccount < Action
  def self.as(user)
    visit '/'
    click_link 'Register'

    registration = RegistrationPage.new
    registration.email = user.email
    registration.password = user.password
    registration.password_confirmation = user.password_confirmation
    registration.submit_registration
  end
end