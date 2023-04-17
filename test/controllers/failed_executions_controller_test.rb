require "test_helper"

class FailedExecutionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get failed_executions_index_url
    assert_response :success
  end
end
