class Unit < ApplicationRecord
    belongs_to :user 
    has_many :unit_warriors 
    has_many :warriors, through: :unit_warriors

    def total 
        sum = 0
        self.warriors.each do |warrior|
            sum += warrior.kills
        end 
        sum
    end
end
