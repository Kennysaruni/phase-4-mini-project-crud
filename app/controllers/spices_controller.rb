class SpicesController < ApplicationController

    def index
        render json: Spice.all
    end

    def create
        spices = spices.create(spice_params)
        render json: spices, status: :created
    end

    def update
        spices = Spice.find_by(id:params[:id])
        if spices
            spices.update(spice_params)
            render json: spices, status: :ok
        else
            render json: {error: "Spice not found"}, status: :not_found
        end
    end

    def destroy
        spices = Spice.find_by(id: params[:id])
        if spices
            spices.destroy
            head :no_content
        else
            render json: {error: "Spice not found"}, status: :not_found
        end
    end



    private
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end


end
