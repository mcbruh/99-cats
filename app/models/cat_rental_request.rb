class CatRentalRequest < ApplicationRecord

    STATUS = %w(PENDING APPROVED DENIED)

    validates :cat_id, :start_date, :end_date, :status, presence: true
    validates :status, inclusion: STATUS, presence: true
    belongs_to :cat
    validate :does_not_overlap_approved_request

    def overlapping_requests
        #A cat rental request starting on 02/25/17 and ending on 02/27/17.
        #There is a overlap if another cat rental also starts on the same day (02/25/17).
        #There is a overlap if another cat rental request starts on the return day (02/27/17).
        #There is a overlap if another cat rental request starts between the start and end dates (02/26/17).
        #Find cases where there is no overlap then negate it
        #Start point of B comes after end point of A. B(start) > A(end)
        #Start point of A comes after end point of B. A(start) > B(end)
        #So there is not overlap when B(start) > A(end) || A(start) > B(end)
        #There is overlap when !(B(start) > A(end) || A(start) > B(end))
        #Or !(B(start) > A(end)) && !(A(start) > B(end))
        CatRentalRequest
            .where.not(id: self.id) #excludes self
            .where(cat_id: cat_id)
            .where(<<-SQL, start_date: start_date, end_date: end_date)
                NOT((start_date > :end_date) OR (:start_date > end_date))
            SQL
    end

    def overlapping_approved_requests
        overlapping_requests.where(status: 'APPROVED')
    end

    def does_not_overlap_approved_request
       if overlapping_pending_requests.exists?
        errors[:base] << 'Request overlaps with existing approved request'
       end
    end

    def overlapping_pending_requests
        overlapping_requests.where(status: 'PENDING')
    end

    def approve!
        CatRentalRequest.transaction do
            self.status = 'APPROVED'
            self.save!
            overlapping_pending_requests.update_all(status: 'DENIED')
        end
    end

    def deny!
        CatRentalRequest.transaction do
            self.status = 'DENIED'
            self.save!
        end
    end

    def pending?
        self.status == 'PENDING'
    end

end