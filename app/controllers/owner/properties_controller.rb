
class Owner::PropertiesController < ApplicationController
    before_action :authenticate_user! # Ensure user is authenticated
  
    def new
      @property = Property.new
    end
  
    def create
      @property = current_user.properties.build(property_params)
  
      if @property.save
        redirect_to owner_dashboard_index_path, notice: 'Property was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def property_params
      params.require(:property).permit(:name, :description, :image_url, :location_name, :latitude, :longitude)
    end
  end
  