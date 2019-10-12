class Page
  include Capybara::DSL

  def has_error?(message)
    page.has_content?(message)
  end

  def has_message?(message)
    page.has_content?(message)
  end

  def showing_user_as_logged_in?
    has_message?('Signed in successfully')   
  end
end