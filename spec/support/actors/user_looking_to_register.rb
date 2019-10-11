class UserLookingToRegister < OpenStruct
  def self.with_valid_details
    new(
      email: 'ryan@email.com',
      password: 'ValidP4ssword', 
      password_confirmation: 'ValidP4ssword'
    )
  end
end