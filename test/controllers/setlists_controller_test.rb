require 'test_helper'

class SetlistsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @setlist = setlists(:one)
  end

  test "should get index" do
    sign_in users(:homer)
    get setlists_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:homer)
    get new_setlist_url
    assert_response :success
  end

  test "should create setlist" do
    sign_in users(:homer)
    assert_difference('Setlist.count') do
      post setlists_url, params: { setlist: { name: @setlist.name, user_id: @setlist.user_id } }
    end

    assert_redirected_to setlist_url(Setlist.last)
  end

  test "should show setlist" do
    sign_in users(:homer)
    get setlist_url(@setlist)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:homer)
    get edit_setlist_url(@setlist)
    assert_response :success
  end

  test "should update setlist" do
    sign_in users(:homer)
    patch setlist_url(@setlist), params: { setlist: { name: @setlist.name, user_id: @setlist.user_id } }
    assert_redirected_to setlist_url(@setlist)
  end

  test "should destroy setlist" do
    sign_in users(:homer)
    assert_difference('Setlist.count', -1) do
      delete setlist_url(@setlist)
    end

    assert_redirected_to setlists_url
  end
end
