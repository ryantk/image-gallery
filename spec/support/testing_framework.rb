require_relative 'framework/page'
require_relative 'framework/actor'
require_relative 'framework/action'
require_relative 'topics/authentication/registered_user'
Dir[Rails.root.join("spec/support/topics/**/*.rb")].each { |f| require f }

module FrameworkHelpers
  def the_page
    Page.new
  end
end

RSpec.configure do |config|
  config.include FrameworkHelpers
end