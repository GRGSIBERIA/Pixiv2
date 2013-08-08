require "./lib/error.rb"

class TC_Find < Test::Unit::TestCase
  def setup

  end

  def s_tag_test(options)
    Find.MakeURL("s_tag", "test", options)
  end

  def test_find_by_tag
    Find.MakeURL("s_tag", "test hoge")
    puts s_tag_test({:p => 1})
    puts s_tag_test({:p => 1, :order => "date_d"})
  end

  def faild_test(options)
    assert_raise(Pixiv2::OptionNotFoundError, "faild assert_raise") {
      Find.MakeURL("s_tag", "aiueo", options)
    }
  end

  def test_find_assertion
    faild_test({:xxx => 1})
    faild_test({:p => 2, :xxx => 1})
  end
end