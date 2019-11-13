class Cat < ApplicationRecord

    COLORS = %w(White Black Ginger Blue/Grey Cream Brown Cinnamon Fawn)
    SEX = %w(M F)

    include ActionView::Helpers::DateHelper
    validates :color, inclusion: COLORS, presence: true
    validates :sex, inclusion: SEX, presence: true
    validates :birth_date, :name, :description, presence: true
    has_many :cat_rental_requests, dependent: :destroy

    #COLORS = ["white", "black", "ginger", "blue/grey", "cream", "brown", "cinnamon", "fawn"]
    #SEX = ["M","F"]

    def age
        time_ago_in_words(birth_date)
    end

end