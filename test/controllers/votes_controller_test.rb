require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get votes_index_url
    assert_response :success
  end

  test "should get show" do
    get votes_show_url
    assert_response :success
  end

  test "should get create" do
    get votes_create_url
    assert_response :success
  end

  test "should get new" do
    get votes_new_url
    assert_response :success
  end

  test "should get edit" do
    get votes_edit_url
    assert_response :success
  end

end
