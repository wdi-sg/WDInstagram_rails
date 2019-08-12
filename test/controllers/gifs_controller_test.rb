require 'test_helper'

class GifsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get gifs_new_url
    assert_response :success
  end

end
