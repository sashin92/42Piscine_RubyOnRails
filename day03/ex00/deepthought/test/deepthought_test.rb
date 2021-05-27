require "minitest/autorun"
require "deepthought"

class DeepthoughtTest < Minitest::Test

  def setup
    @deepthought = Deepthought.new
  end

  def test_check_expected_object
    assert_equal Deepthought, @deepthought.class
  end

  def test_check_response_one
  	assert_equal "42", @deepthought.respond("The Ultimate Question of Life, the Universe and Everything")
  end

  def test_check_response_two
  	assert_equal "Mmmm i'm bored", @deepthought.respond("i'm wrong message")
  end

end
