require "./lib/error.rb"

class Login
  def self.Login(id, pass)
    ag = Mechanize.new
    ag.user_agent_alias = "Windows Mozilla"

    page = ag.get('https://www.secure.pixiv.net/login.php')
    next_page = ClickLogin(page, id, pass)

    CheckLoginFailer(next_page, id)

    return ag
  end

  def self.ClickLogin(page, id, pass)
    page.form_with(:class => "login-form") do |form|
      form.pixiv_id = id
      form.pass = pass
    end.submit
  end

  def self.CheckLoginFailer(next_page, id)
    if next_page.uri.to_s != "http://www.pixiv.net/mypage.php" then
      raise Pixiv2::LoginFailedError, "#{id} or password not found."
    end
  end
end