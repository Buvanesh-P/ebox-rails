require "test_helper"

class OkrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @okr = okrs(:one)
  end

  test "should get index" do
    get okrs_url
    assert_response :success
  end

  test "should get new" do
    get new_okr_url
    assert_response :success
  end

  test "should create okr" do
    assert_difference("Okr.count") do
      post okrs_url, params: { okr: { month: @okr.month, userinfos_id: @okr.userinfos_id, users_id: @okr.users_id, year: @okr.year } }
    end

    assert_redirected_to okr_url(Okr.last)
  end

  test "should show okr" do
    get okr_url(@okr)
    assert_response :success
  end

  test "should get edit" do
    get edit_okr_url(@okr)
    assert_response :success
  end

  test "should update okr" do
    patch okr_url(@okr), params: { okr: { month: @okr.month, userinfos_id: @okr.userinfos_id, users_id: @okr.users_id, year: @okr.year } }
    assert_redirected_to okr_url(@okr)
  end

  test "should destroy okr" do
    assert_difference("Okr.count", -1) do
      delete okr_url(@okr)
    end

    assert_redirected_to okrs_url
  end
end
