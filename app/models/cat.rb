class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    validates :color, inclusion: { in: COLORS }, presence: true
    validates :sex, inclusion: { in: SEX }, presence: true
    validates :birth_date, :name, :description, presence: true

    COLORS = ["white", "black", "ginger", "blue/grey", "cream", "brown", "cinnamon", "fawn"]
    SEX = ["M","F"]

    

end