require "test_helper"

class CheatSheetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cheat_sheet_index_url
    assert_response :success
  end
end
