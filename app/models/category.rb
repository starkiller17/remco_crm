class Category < ApplicationRecord
    validates :category, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3}
    validates :status, presence: true
end