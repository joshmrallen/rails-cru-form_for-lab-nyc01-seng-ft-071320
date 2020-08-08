class SongsController < ApplicationController
    before_action :find_song, only: [:show, :edit, :update]
    before_action :all_artists, :all_genres, only: [:new, :edit]

    def index
        @songs = Song.all
    end

    def show
        find_song
    end

    def new
        @song = Song.new
        all_artists
        all_genres
    end

    def create
        @song = Song.create(song_params)
        redirect_to song_path(@song)
    end

    def edit
        find_song
        all_artists
        all_genres
    end

    def update
        find_song
        @song.update(song_params)
        redirect_to song_path(@song)
    end

    private
    def song_params
        params.require(:song).permit(:name, :artist_id, :genre_id)
    end

    def find_song
        @song = Song.find(params[:id])
    end

    def all_artists
        @artists = Artist.all
    end

    def all_genres
        @genres = Genre.all
    end
end