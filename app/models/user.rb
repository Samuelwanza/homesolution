class User < ApplicationRecord
  has_many :properties, class_name: 'Property', foreign_key: 'owner_id'
  has_many :houses, class_name: 'House', foreign_key: 'house_id'
  has_many :requests, class_name: 'Request', foreign_key: 'owner_id'
  has_many :requests, class_name: 'Request', foreign_key: 'tenant_id'
  validates :name, presence: true
  validates :role, presence: true
end
