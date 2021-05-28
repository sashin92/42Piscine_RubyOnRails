require "minitest/autorun"
require "Ft_wikipedia"

class Ft_wikipedia_test < Minitest::Test

  def setup
    @ft_wikipedia = Ft_wikipedia.new
  end

  def test_check_expected_object
    assert_equal Ft_wikipedia, @ft_wikipedia.class
  end

  def test_check_search_end
    
  	assert_equal "Dead end page reached", @ft_wikipedia.search("User:Thangmayducminh")
  end


end
