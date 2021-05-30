require "test_helper"
# This is for CheatSheet app's controller test.
class CheatSheetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cheat_sheet_index_url
    assert_response :success
  end
end
