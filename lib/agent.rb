require "./lib/login.rb"
require "./lib/find.rb"

class PixivAgent
  def initialize(user_id, passwd)
    @agent = Login.Login(user_id, passwd)
  end

  def find_by_tag(keywords, full=true, options={})
    if full then
      Find.MakeURL("s_tag_full", keywords, options)
    else
      Find.MakeURL("s_tag", keywords, options)
    end
  end

  def find_by_keyword(keywords, options={})
    Find.MakeURL("s_tc", keywords, options)
  end
end