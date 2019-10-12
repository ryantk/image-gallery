class UserLookingToRegister < Actor
  def self.with_valid_details
    build(:user)
  end

  def self.with_invalid_email_and_missing_password
    build(:user, :invalid_email, :missing_password)
  end
end