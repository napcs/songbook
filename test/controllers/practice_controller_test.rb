require 'test_helper'

class PracticeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get index" do
    sign_in users(:homer)
    get practice_url
    assert_response :redirect
  end

  test "should get practice setlists" do
    sign_in users(:homer)
    get practice_setlist_url(setlists(:one))
    assert_response :redirect
  end
  test "should get show" do
    sign_in users(:homer)
    get practice_url  # gotta hit index first to get the list of songs to play.
    get practice_song_url
    assert_response :success
  end

  test "should redirect to songs if they don't have any songs and try to to to a song url" do
    user = users(:homer)
    sign_in user
    user.songs.delete_all
    get practice_song_url
    assert_response :redirect
    assert_redirected_to songs_url
  end

  test "should redirect to songs if they don't have any songs and go to practice" do
    user = users(:homer)
    sign_in user
    user.songs.delete_all
    get practice_url
    assert_response :redirect
    assert_redirected_to songs_url
  end

end
