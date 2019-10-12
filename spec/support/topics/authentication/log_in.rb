class LogIn
  def self.as(user)
    log_in = LoginPage.new
    log_in.visit '/account/login'
    log_in.email = user.email
    log_in.password = user.password
    log_in.submit_login
  end
end