class RegisteredUser < Actor
  def self.with_correct_login_details
    new create(:user)
  end
end