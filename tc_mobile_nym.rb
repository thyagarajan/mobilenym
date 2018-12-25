require_relative "mobilenum"
require "test/unit"
 
class TestMobileNym < Test::Unit::TestCase
 
  def test_for_mobile_number_input
    
    assert_equal(["catamounts"], MobileNym.new("2282668687").test_stub)
    assert_equal(["motortruck"], MobileNym.new("6686787825").test_stub)
    assert_equal(nil, MobileNym.new("9840411332").test_stub)
    assert_equal(nil, MobileNym.new("abcdefghij").test_stub)
    assert_equal(["kickboxing"], MobileNym.new("5425269464").test_stub)
  end
 
 
end