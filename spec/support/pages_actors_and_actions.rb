require_relative 'page_objects/page'
Dir[Rails.root.join("spec/support/page_objects/*.rb")].each { |f| require f }
Dir[Rails.root.join("spec/support/actions/*.rb")].each { |f| require f }
Dir[Rails.root.join("spec/support/actors/*.rb")].each { |f| require f }
Dir[Rails.root.join("spec/support/assertions/*.rb")].each { |f| require f }