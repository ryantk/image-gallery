class NewUserAccount
  def self.has_been_created_for?(user)
    User.where(email: user.email).exists?
  end
end