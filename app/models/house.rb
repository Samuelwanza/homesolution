class House < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :property
  belongs_to :tenant, class_name: 'User', foreign_key: 'tenant_id'
  validates :name, presence: true
  validates :description, presence: true
  validates :image_url, true
end
