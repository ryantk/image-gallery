class StartWithExistingUser
  def self.already_logged_in
    user = create(:user)
    login_as(user)
    new(user)
  end

  def self.as(actor)
    actor.ability_to(self)
  end

  attr_reader :user

  def initialize(user)
    @user = user
  end
end