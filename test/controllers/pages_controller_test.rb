require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "get home page" do
    get root_path

    assert_response :success
  end
end
