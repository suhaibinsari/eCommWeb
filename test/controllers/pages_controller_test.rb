require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get abous_us" do
    get pages_abous_us_url
    assert_response :success
  end

  test "should get donate" do
    get pages_donate_url
    assert_response :success
  end

  test "should get contact_info" do
    get pages_contact_info_url
    assert_response :success
  end
end
