class LogIn < Action
  def self.as(user)
    visit '/'
    click_link 'Log in'

    log_in = LoginPage.new
    log_in.email = user.email
    log_in.password = user.password
    log_in.submit_login
  end
end