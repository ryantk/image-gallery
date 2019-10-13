class Actor
  def self.named(name)
    new(name)
  end

  attr_reader :abilities

  def initialize(name)
    @name = name
    @abilities = {}
  end

  def who_can(ability)
    abilities[ability.class] = ability
    self
  end
  alias_method :will, :who_can
  alias_method :can,  :who_can

  def ability_to(ability_type)
    abilities[ability_type]
  end

  def attempts_to(*actions)
    Array(actions).each do |action|
      action.perform_as(self)
    end
  end
end

# class Actor < SimpleDelegator
#   extend FactoryBot::Syntax::Methods
#   extend Warden::Test::Helpers

#   # this enables fluid dsl in tests,
#   # currently the ability will be executed before it is passed in
#   def self.who(ability)
#     self
#   end

#   # this enables fluid dsl in tests,
#   # currently the ability will be executed before it is passed in
#   def self.has(state)
#     self
#   end

#   attr_accessor :user
  
#   def shown_error?(message, args={})
#     page_to_see_error_on = args.delete(:on)
#     page_to_see_error_on.has_error?(message)
#   end

#   def shown?(content, args={})
#     page_to_see_error_on = args.delete(:on)
#     page_to_see_error_on.has_content?(content)
#   end
# end