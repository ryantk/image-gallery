class NewUserAccount
  def has_been_created_for?(user)
    User.where(email: user.email).exists?
  end
end

def a_new_user_account
  NewUserAccount.new
end