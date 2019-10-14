class Page
  include Capybara::DSL

  def has_error?(message)
    page.has_content?(message)
  end

  def has_message?(message)
    page.has_content?(message)
  end
end