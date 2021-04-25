class Credit < ApplicationRecord
    validates :credit, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3 }
    validates :status, presence: true
    has_many :bill_tos
    has_many :payment_methods, through: :bill_tos
    has_many :customers, through: :bill_tos
end