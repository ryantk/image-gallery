class Actor < SimpleDelegator
  extend FactoryBot::Syntax::Methods
  extend Warden::Test::Helpers
  
  def shown_error?(message, args={})
    page_to_see_error_on = args.delete(:on)
    page_to_see_error_on.has_error?(message)
  end

  def shown?(content, args={})
    page_to_see_error_on = args.delete(:on)
    page_to_see_error_on.has_content?(content)
  end
end