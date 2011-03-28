require 'test_helper'

class SpeechesControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get approve" do
    get :approve
    assert_response :success
  end

  test "should get vote" do
    get :vote
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

end
