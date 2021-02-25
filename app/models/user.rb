class User < ApplicationRecord
    has_many :units
    has_many :unit_warriors
    has_many :warriors, through: :unit_warriors

end
