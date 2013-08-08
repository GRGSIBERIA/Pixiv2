require "./lib/login.rb"
require "./lib/find.rb"

class PixivAgent
  def initialize(user_id, passwd)
    @agent = Login.Login(user_id, passwd)
  end

  def find_by_tag(keywords, options)

  end

  def find_by_keyword(keywords, options)

  end
end