require 'mechanize'

class Agent
  def initialize(user_id, passwd)
    @agent = Login(Mechanize.new, user_id, passwd)

  end

  def Login(ag, id, pass)
    page = ag.get('https://www.secure.pixiv.net/login.php')
    next_page = ClickLogin(page, id, pass)

    if CheckLoginFailer(next_page)
      raise LoginError
    end

    return ag
  end

  def ClickLogin(page, id, pass)
    page.form_with(:class => "login_form") do |form|
      form.login_pixiv_id = id
      form.login_password = pass
    end.submit
  end

  def CheckLoginFailer(next_page)
    next_page.at("title").inner_text != "[pixiv] ログイン"
  end
end