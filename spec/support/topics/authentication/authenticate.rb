class Authenticate
  def self.with_correct_details
    user = FactoryBot.create(:user)
    new(user)
  end

  attr_reader :user
  attr_reader :email
  attr_reader :password

  def initialize(user)
    @user = user
    @email = user.email
    @password = user.password
  end

  def self.as(actor)
    actor.ability_to(self)
  end
end