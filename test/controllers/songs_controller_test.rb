require 'test_helper'

class SongsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @song = songs(:one)
  end

  test "should get index" do
    sign_in users(:homer)
    get songs_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:homer)
    get new_song_url
    assert_response :success
  end

  test "should create song" do
    sign_in users(:homer)
    assert_difference('Song.count') do
      post songs_url, params: { song: { lyrics: @song.lyrics, name: @song.name, user_id: @song.user_id } }
    end

    assert_redirected_to songs_url
  end

  test "should show song" do
    sign_in users(:homer)
    get song_url(@song)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:homer)
    get edit_song_url(@song)
    assert_response :success
  end

  test "should update song" do
    sign_in users(:homer)
    patch song_url(@song), params: { song: { lyrics: @song.lyrics, name: @song.name, user_id: @song.user_id } }
    assert_redirected_to songs_url
  end

  test "should destroy song" do
    sign_in users(:homer)
    assert_difference('Song.count', -1) do
      delete song_url(@song)
    end

    assert_redirected_to songs_url
  end
end
