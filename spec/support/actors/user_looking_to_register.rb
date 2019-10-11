class UserLookingToRegister < OpenStruct
  def self.with_valid_details
    new(
      email: 'ryan@email.com',
      password: 'ValidP4ssword', 
      password_confirmation: 'ValidP4ssword'
    )
  end

  def self.with_invalid_email_and_missing_password
    new(
      email: 'jenny.com',
      password: '', 
      password_confirmation: ''
    )
  end
end