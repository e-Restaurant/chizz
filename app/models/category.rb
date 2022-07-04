class Category < ApplicationRecord
  belongs_to :users, optional: true
  has_many :products
end
