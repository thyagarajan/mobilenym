require_relative "mobilenum"
require "test/unit"
 
class TestMobileNym < Test::Unit::TestCase
 
  def test_mobile_nym
    
    assert_equal(["catamounts"], MobileNym.new("2282668687").test_stub)
    assert_equal(["motortruck"], MobileNym.new("6686787825").test_stub)
  end
 
end