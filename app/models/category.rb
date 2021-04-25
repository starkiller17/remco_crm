class Category < ApplicationRecord
    has_many :customers, dependent: :destroy
    has_many :classifications, through: :customers
    validates :category, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3}
    validates :status, presence: true
end