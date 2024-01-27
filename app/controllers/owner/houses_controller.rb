class Owner::HousesController < ApplicationController
    before_action :authenticate_user
  
    def destroy
      @house = House.find(params[:id])
      @house.destroy
      redirect_to property_path(@house.property), notice: 'House was successfully deleted.'
    end
  end
  