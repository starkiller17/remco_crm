class Customer < ApplicationRecord
    belongs_to :category
    belongs_to :classification
    has_many :bill_tos
    has_many :addresses
    validates :customer, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3 }
    validates :status, presence: true
end