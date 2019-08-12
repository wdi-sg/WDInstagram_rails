require 'test_helper'

class TextsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get texts_new_url
    assert_response :success
  end

end
