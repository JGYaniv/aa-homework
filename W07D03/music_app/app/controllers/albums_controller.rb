class AlbumsController < ApplicationController
    before_action :ensure_logged_in
    
    def new
        @album = Album.new
        @band_id = params[:band_id]
    end
    
    def create
        @album = Album.new(album_params)
        if @album.save
            render :show
        else
            flash[:errors] = ["Invalid album name"]
            render :new
        end
    end

    def index
        @albums = Album.all
    end

    def show
        @album = Album.find(params[:id])
    end

    def edit
        @album = Album.find(params[:id])
        @band_id = @album.band_id
    end

    def update
        @album = Album.find(params[:id])
        if @album && @album.update(album_params)
            render :show
        else
            flash[:errors] = ["Invalid album name"]
            render :edit
        end
    end

    def destroy
        @album = Album.find(params[:id])
        @album.destroy if @album
        redirect_to albums_url
    end

    private

    def album_params
        params.require(:album).permit(:title, :year, :live, :band_id)
    end
end