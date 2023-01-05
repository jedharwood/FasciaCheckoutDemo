class Material < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :thickness, presence: true
    validates :width, presence: true
end

