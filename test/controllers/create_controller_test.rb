require 'test_helper'

class CreateControllerTest < ActionDispatch::IntegrationTest
  test "should get Categories" do
    get create_Categories_url
    assert_response :success
  end

end
