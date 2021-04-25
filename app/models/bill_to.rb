class BillTo < ApplicationRecord
    belongs_to :customer
    belongs_to :payment_method
    belongs_to :credit
    validates :bill_to, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 5 }
end