require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username: "Ben Who", email: "bw@abc.com
    ", password: "password", password_confirmation: "password")
  end

  test "should be a valid user" do
    assert @user.valid?
  end

  test "associated task should be destroyed when user deleted" do
    @user.save
    @user.tasks.create!(content: "hello")
    assert_difference 'Task.count', -1 do
     @user.destroy
    end
  end

  

  # test "the truth" do
  #   assert true
  # end
end
