class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :users, optional: true
  has_many :products
end
