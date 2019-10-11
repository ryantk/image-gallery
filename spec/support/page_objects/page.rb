class Page
  include Capybara::DSL

  def self.has_error?(message)
    Page.new.has_error?(message)
  end

  def has_error?(message)
    page.has_content?(message)
  end
end