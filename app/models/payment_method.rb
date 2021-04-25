class PaymentMethod < ApplicationRecord
    validates :payment_method, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4 }
    validates :status, presence: true
    has_many :bill_tos
    has_many :credits, through: :bill_tos
    has_many :customers, through: :bill_tos
end