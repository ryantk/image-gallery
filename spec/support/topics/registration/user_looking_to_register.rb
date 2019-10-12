class UserLookingToRegister < Actor
  def self.with_valid_details
    new build(:user)
  end

  def self.with_invalid_email_and_missing_password
    new build(:user, :invalid_email, :missing_password)
  end

  def has_an_account_created?
    User.where(email: email).exists?
  end
end