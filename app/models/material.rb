class Material < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :thickness, presence: true
  validates :width, presence: true

  monetize :price_cents, allow_nil: true

  has_one_attached :image, dependent: :destroy
end
