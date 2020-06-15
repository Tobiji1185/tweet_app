require 'test_helper'

class FromControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get from_top_url
    assert_response :success
  end

end
