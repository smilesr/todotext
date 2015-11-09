require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username: "Ben Who", email: "bw@abc.com
    ", password: "password", password_confirmation: "password")
  end

  test "should be a valid user" do
    assert @user.valid?
  end

  

  # test "the truth" do
  #   assert true
  # end
end
