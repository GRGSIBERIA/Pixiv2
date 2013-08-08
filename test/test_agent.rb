
class TC_Agent < Test::Unit::TestCase
  def setup
    open("./test/user.txt") do |file|
      @data = file.gets.chomp.split(",")
    end
  end

  def test_login
    Agent.new(@data[0], @data[1])
  end

  def test_login_faild
    assert_raise(LoginFaildError) {
      Agent.new("testhoge", "hohehoheuhoeusantoeh")
    }
  end
end