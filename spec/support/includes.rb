require_relative 'pages/page'
require_relative 'actors/actor'
Dir[Rails.root.join("spec/support/pages/*.rb")].each { |f| require f }
Dir[Rails.root.join("spec/support/actions/*.rb")].each { |f| require f }
Dir[Rails.root.join("spec/support/actors/*.rb")].each { |f| require f }
Dir[Rails.root.join("spec/support/assertions/*.rb")].each { |f| require f }

def the_page
  Page.new
end