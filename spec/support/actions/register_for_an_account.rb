class RegisterForAnAccount
  def self.as(user)
    registration = RegistrationPage.new
    registration.visit '/account/registration'
    registration.email = user.email
    registration.password = user.password
    registration.password_confirmation = user.password_confirmation
    registration.submit_registration
  end
end