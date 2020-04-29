class TracksController < ApplicationController
    before_action :ensure_logged_in
    
    def new
        @track = Track.new
        @album_id = params[:album_id]
    end
    
    def create
        @track = Track.new(track_params)
        if @track.save
            render :show
        else
            flash[:errors] = ["Invalid track params"]
            render :new
        end
    end

    def index
        @tracks = Track.all
    end

    def show
        @track = Track.find(params[:id])
    end

    def edit
        @track = Track.find(params[:id])
        @album_id = @track.album_id
    end

    def update
        @track = Track.find(params[:id])
        if @track && @track.update(track_params)
            render :show
        else
            flash[:errors] = ["Invalid track params"]
            render :edit
        end
    end

    def destroy
        @track = Track.find(params[:id])
        @track.destroy if @track
        render :index
    end

    private

    def track_params
        params.require(:track).permit(:title, :ord, :album_id, :bonus, :lyrics)
    end
end