require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "email should be rejected" do
    user = User.new(email: "notvalid",
                    password: "abcdefg",
                    password_confirmation: "abcdefg")
    assert_not user.valid?
  end

  test "email should be accepted" do
    user = User.new(email: "email.mong+ohaha@blubla.com",
                    password: "abcdefg",
                    password_confirmation: "abcdefg")
    assert user.valid?
  end

  test "user has confirm_token?" do
    user = User.create(email: "email.mong+ohaha@blubla.com",
                       password: "abcdefg",
                       password_confirmation: "abcdefg")
    assert_not_nil user.confirmation_token
  end

end
