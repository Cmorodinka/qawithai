require "test_helper"

class PassedExecutionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get passed_executions_index_url
    assert_response :success
  end
end
