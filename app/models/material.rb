# frozen_string_literal: true

class Material < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :thickness, presence: true, numericality: { greater_than: 0 }
  validates :width, presence: true, numericality: { greater_than: 0 }

  monetize :price_cents, allow_nil: true

  has_one_attached :image, dependent: :destroy
  has_one :favourite, dependent: :destroy
  has_many :basket_material, dependent: :destroy
end
