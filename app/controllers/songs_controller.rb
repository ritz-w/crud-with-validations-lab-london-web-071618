class SongsController < ApplicationController
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = Song.all.find(params[:id])
  end

  def update
    @song = Song.all.find(params[:id])
    @song_check = @song.update(song_params)
    if @song_check == true
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def show
    @song = Song.all.find(params[:id])
  end

  def index
    @songs = Song.all
  end

  def destroy
    @song = Song.all.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end


  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

end
