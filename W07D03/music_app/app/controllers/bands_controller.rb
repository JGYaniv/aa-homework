class BandsController < ApplicationController
    before_action :ensure_logged_in
    
    def new
        @band = Band.new
    end
    
    def create
        @band = Band.new(band_params)
        if @band.save
            render :show
        else
            flash[:errors] = ["Invalid band name"]
            render :new
        end
    end

    def index
        @bands = Band.all
    end

    def show
        @band = Band.find(params[:id])
    end

    def edit
        @band = Band.find(params[:id])
    end

    def update
        @band = Band.find(params[:id])
        if @band && @band.update(band_params)
            render :show
        else
            flash[:errors] = ["Invalid band name"]
            render :edit
        end
    end

    def destroy
        @band = Band.find(params[:id])
        @band.destroy if @band
        redirect_to bands_url
    end

    private

    def band_params
        params.require(:band).permit(:name)
    end
end