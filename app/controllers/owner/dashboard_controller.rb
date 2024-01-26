class Owner::DashboardController < ApplicationController
    before_action :authenticate_user! # Ensure user is authenticated
    def index
    end
end
