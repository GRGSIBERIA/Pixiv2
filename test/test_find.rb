class TC_Find < Test::Unit::TestCase
  def setup

  end

  def test_find_by_tag
    Find.MakeURL("s_tag", "test")
    Find.MakeURL("s_tag", "test hoge")
  end
end