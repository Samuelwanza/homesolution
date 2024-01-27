
class Owner::DashboardController < ApplicationController
    before_action :authenticate_user! # Ensure user is authenticated
  
    def index
      @properties = current_user.properties
      @user=current_user
    end

    def predict_rent
        openai_client = OpenAI::Client.new(
            api_key: ENV['OPENAI_API_KEY'],
        )

        rental_listing = {
            bedrooms: 2,
            neighborhood: 'Nyarugenge',
            condition: 'good',
            furnishings: 'furnished',
        }

        rental_listing_json = rental_listing.to_json

        response = openai_client.completions(
            prompt: "What is the estimated rent for a two-bedroom house in Nyarugenge, Kigali, Rwanda with the following characteristics: #{rental_listing_json}",
            max_tokens: 64,
            temperature: 0.9,
            top_p: 0.9,
        )

        predicted_rent = response.choices[0].text.split(' ')[-1]
        predicted_rent = '%.2f' % predicted_rent
        return predicted_rent
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
  