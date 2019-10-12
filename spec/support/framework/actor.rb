class Actor < SimpleDelegator
  extend FactoryBot::Syntax::Methods
  extend Warden::Test::Helpers
end