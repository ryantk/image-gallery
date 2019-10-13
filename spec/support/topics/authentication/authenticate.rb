class Authenticate
  def self.with_correct_details
    user = FactoryBot.create(:user)
    new(user.email, user.password)
  end

  attr_reader :email
  attr_reader :password

  def initialize(email, password)
    @email = email
    @password = password
  end

  def self.as(actor)
    actor.ability_to(self)
  end
end