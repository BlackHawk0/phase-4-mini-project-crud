class SpicesController < ApplicationController

    wrap_parameters format: []

    def index
        render json: Spice.all, status: :ok
    end

    def create
        render json: Spice.create(spice_params), status: :created
    end

    def show
        spice = Spice.find_by(id: params[:id])
        
        if spice
            render json: spice, status: :ok
        else
            render json: {error: "Spice not found"}, status: :not_found
        end

    end

    def update
        spice = Spice.find_by(id: params[:id])

        if spice
            spice.update(spice_params)
            render json: spice, status: :accepted
        else
            render json: {error: "Spice not found"}, status: :not_found
        end
    end

    def destroy
        spice = Spice.find_by(id: params[:id])

        if spice
            spice.destroy
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