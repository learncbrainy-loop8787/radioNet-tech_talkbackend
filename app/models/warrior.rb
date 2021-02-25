class Warrior < ApplicationRecord
    has_many :unit_Warriors, dependent: :destroy
    has_many :units, through: :unit_warriors
end
