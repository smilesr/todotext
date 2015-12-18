require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  def setup
    @user = users(:chester)
    @task = @user.tasks.build(content: "grocery store", completion: false, due_date: "December 1, 2015")
  end
  
  test "should be valid" do
    assert @task.valid?
  end

  test "user_id should be present" do
    @task.user_id = nil
    assert_not @task.valid?
  end

  test "content should be present" do
    @task.content = nil
    assert_not @task.valid?
  end

  test "content should not be over 140 characters" do
    @task.content = "x" * 141
    assert_not @task.valid?
  end

  test "order of tasks should be most recent first" do
    assert_equal tasks(:most_recent), Task.first
  end
end
