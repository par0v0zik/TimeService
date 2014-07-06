require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get time" do
    get :time
    assert_response :success
  end

end
