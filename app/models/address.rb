class Address <ApplicationRecord
    belongs_to :customer
    belongs_to :bill_to
    validates :address, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 5 }
    validates :status, presence: true
end