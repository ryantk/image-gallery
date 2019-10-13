class LogIn < Action
  def self.with_credentials
    new
  end

  def perform_as(actor)
    visit '/'
    click_link 'Log in'

    user = Authenticate.as(actor)
    log_in = LoginPage.new
    log_in.email = user.email
    log_in.password = user.password
    log_in.submit_login
  end
end