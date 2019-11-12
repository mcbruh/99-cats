class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    validates :color, inclusion: { in: ["White", "Black", "Ginger", "Blue/Grey", "Cream", "Brown", "Cinnamon", "Fawn"] }, presence: true
    validates :sex, inclusion: { in: ["M","F"] }, presence: true
    validates :birth_date, :name, :description, presence: true

    #COLORS = ["white", "black", "ginger", "blue/grey", "cream", "brown", "cinnamon", "fawn"]
    #SEX = ["M","F"]

    def age
        ((Time.now - birth_date.to_time) / 1.year.seconds).floor
    end

end