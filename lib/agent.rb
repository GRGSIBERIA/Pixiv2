#-*- encoding: utf-8
require 'mechanize'

class LoginFailedError < StandardError; end

class Agent
  def initialize(user_id, passwd)
    @agent = Login(Mechanize.new, user_id, passwd)
  end

  def Login(ag, id, pass)
    page = ag.get('https://www.secure.pixiv.net/login.php')
    next_page = ClickLogin(page, id, pass)

    if CheckLoginFailer(next_page)
      raise LoginFailedError, "#{id} or password not found."
    end

    return ag
  end

  def ClickLogin(page, id, pass)
    page.form_with(:class => "login-form") do |form|
      form.pixiv_id = id
      form.pass = pass
    end.submit
  end

  def CheckLoginFailer(next_page)
    next_page.at("title").inner_text != "[pixiv] ログイン"
  end
end