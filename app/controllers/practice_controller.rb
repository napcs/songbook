class PracticeController < ApplicationController
  before_action :authenticate_user!

  before_action :has_songs, only: [:index, :show]

  def index
    create_practice_list current_user.songs
    session[:setlist_id] = nil
    redirect_to practice_song_url
  end

  def setlist
    create_practice_list current_user.setlists.find(params[:id]).songs
    session[:setlist_id] = params[:id]
    redirect_to practice_song_url
  end

  def show
    if practice_list.nil? || practice_list.empty?
      if session[:setlist_id]
        redirect_to practice_setlist_url(session[:setlist_id])
      else
        redirect_to practice_url
      end
    else
      @song = current_user.songs.find practice_list_next
    end
  end

  private

  def create_practice_list(songs)
    session[:practice_list] = songs.ids.shuffle
  end

  def reset_practice_list
    session[:practice_list] = nil
  end

  def practice_list
    session[:practice_list]
  end

  def practice_list_next
    session[:practice_list].pop
  end

  def has_songs
    redirect_to songs_url, notice: "You need some songs first." if current_user.songs.empty?
  end
end
