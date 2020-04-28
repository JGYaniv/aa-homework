class FlowersController < ApplicationController
    def index
        @flowers = Flower.all
        render :index
    end

    def new
        @flower = Flower.new
        render :new
    end

    def show
        @flower = Flower.find_by(id: params[:id])
        render :show
    end

    def destroy
        @flower = Flower.find_by(id: params[:id])
        redirect_to garden_url(@flower.garden)
        @flower.destroy
    end

    def create
        @flower = Flower.new(flower_params)
        if @flower.save
            redirect_to garden_url(@flower.garden)
        else
            redirect_to garden_url(@flower.garden)
        end
    end

    private

    def flower_params
        params.require(:flower).permit(:flower_type, :garden_id, :gardener_id)
    end
end