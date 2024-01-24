class Property < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_many :houses
  validates :name, presence: true
  validates :image_url, presence: true
  validates :location_name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
