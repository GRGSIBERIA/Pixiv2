require "./lib/login.rb"
require "./lib/find.rb"

class PixivAgent
  def initialize(user_id, passwd)
    @agent = Login.Login(user_id, passwd)
  end

  def find(type, keywords)
    case type
    when :tag
    when :keyword
    end
  end

  def get(type, id)
    case type
    when :picture
    when :author
    end
  end
end