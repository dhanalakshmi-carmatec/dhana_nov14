require 'test_helper'

class ContactPhoneNumberControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contact_phone_number_index_url
    assert_response :success
  end

  test "should get new" do
    get contact_phone_number_new_url
    assert_response :success
  end

  test "should get edit" do
    get contact_phone_number_edit_url
    assert_response :success
  end

  test "should get show" do
    get contact_phone_number_show_url
    assert_response :success
  end

end
