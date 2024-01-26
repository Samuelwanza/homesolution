
class Owner::PropertiesController < ApplicationController
    before_action :authenticate_user! # Ensure user is authenticated
  
    def new
      @property = Property.new
      @user=current_user
    end
  
    def create
      @property = current_user.properties.build(property_params)
  
      if @property.save
        redirect_to owner_dashboard_index_path, notice: 'Property was successfully created.'
      else
        render :new
      end
    end

    def show
        @property = Property.find(params[:id])
        @houses = @property.houses.includes(:tenant)
        @user=current_user
    end

    def destroy
        @property = Property.find(params[:id])
        @property.destroy
        redirect_to owner_dashboard_index_path, notice: 'Property was successfully deleted.'
    end
  
    private
  
    def property_params
      params.require(:property).permit(:name, :description, :image_url, :location_name, :latitude, :longitude)
    end
  end
  