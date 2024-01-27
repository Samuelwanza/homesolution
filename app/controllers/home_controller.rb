class HomeController < ApplicationController
  def index
    @vacant_houses = House.where(occupied: false)
  end
end
