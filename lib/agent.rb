require 'mechanize'

class Agent
  def initialize(user_id, passwd)
    @agent = login(Mechanize.new)

  end

  def login(ag)
    page = ag.get('https://www.secure.pixiv.net/login.php')
    
    return ag
  end
end