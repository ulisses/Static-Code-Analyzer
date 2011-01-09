require 'test_helper'

class TestesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
