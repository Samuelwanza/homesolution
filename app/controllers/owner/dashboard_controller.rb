
class Owner::DashboardController < ApplicationController
    before_action :authenticate_user! # Ensure user is authenticated
  
    def index
      @properties = current_user.properties
    end
  
    private
  
    # Calculate total rent collected for the current month for a specific property
    def calculate_current_month_rent(property)
      property.houses.where(paid: true).sum(:price)
    end
  
    # Calculate the percentage of rent collected for a specific property
    def calculate_percentage_collected(property)
      total_rent = property.houses.sum(:price)
      return 0 if total_rent.zero?
  
      collected_rent = property.houses.where(paid: true).sum(:price)
      (collected_rent / total_rent.to_f) * 100
    end
  
    helper_method :calculate_current_month_rent, :calculate_percentage_collected
  end
  