require 'test_helper'

class ContactAddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contact_addresses_index_url
    assert_response :success
  end

  test "should get new" do
    get contact_addresses_new_url
    assert_response :success
  end

  test "should get edit" do
    get contact_addresses_edit_url
    assert_response :success
  end

  test "should get show" do
    get contact_addresses_show_url
    assert_response :success
  end

end
