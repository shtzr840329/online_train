require 'test_helper'

class PersonalControllerTest < ActionController::TestCase
  test "should get courses" do
    get :courses
    assert_response :success
  end

end