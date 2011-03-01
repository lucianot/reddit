require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "attributes must not be empty" do 
    user = User.new 
    assert user.invalid? 
    assert user.errors[:username].any?
  end
  
end
