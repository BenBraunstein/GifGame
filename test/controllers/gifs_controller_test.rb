require 'test_helper'

class GifsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get gifs_show_url
    assert_response :success
  end

end
