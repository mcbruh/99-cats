class CatRentalRequest < ApplicationRecord

    validates :cat_id, :start_date, :end_date, presence: true
    validates :status, inclusion: { in: ["PENDING", "APPROVED", "DENIED"] }, presence: true
    belongs_to :cat

end