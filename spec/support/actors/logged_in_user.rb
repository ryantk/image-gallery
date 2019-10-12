class LoggedInUser < Actor
  def self.with_no_galleries
    user = FactoryBot.create(:user)
    login_as(user)
    user
  end
end