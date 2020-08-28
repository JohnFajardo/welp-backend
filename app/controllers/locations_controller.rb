class LocationsController < ApplicationController
    def index
        @locations = Location.within(2, :units => :miles, :origin => [params[:lat], params[:lng]])
        render json: @locations
    end

    def show
        @location = Location.find(params[:location_id])
        render json: @location
    end

    def create
        @newLocation = Location.create(location_params)
        render json: @newLocation
    end

    private
    def location_params
        params.permit(:location_name, :location, :lat, :lng)
    end
end