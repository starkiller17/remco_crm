class Contact < ApplicationRecord
  belongs_to :customer
  validates :name, :last_name, presence: true
  validates :status, presence: true
  validates :name, uniqueness: { scope: [:last_name, :customer_id] } 
end