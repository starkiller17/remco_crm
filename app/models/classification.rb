class Classification < ApplicationRecord
    has_many :customers, dependent: :destroy
    has_many :categories, through: :customers
    validates :classification, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3 }
    validates :status, presence: true
end