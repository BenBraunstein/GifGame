require 'test_helper'

class StyleSynsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get style_syns_index_url
    assert_response :success
  end

  test "should get show" do
    get style_syns_show_url
    assert_response :success
  end

  test "should get new" do
    get style_syns_new_url
    assert_response :success
  end

  test "should get edit" do
    get style_syns_edit_url
    assert_response :success
  end

end
