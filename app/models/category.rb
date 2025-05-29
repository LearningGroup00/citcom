class Category < ApplicationRecord
  has_many :complains, dependent: :nullify
  validates :name, presence: true, uniqueness: true
end
  
