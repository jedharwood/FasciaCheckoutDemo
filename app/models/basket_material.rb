# frozen_string_literal: true

class BasketMaterial < ApplicationRecord
  validates :length, presence: true, numericality: { greater_than: 0 }

  belongs_to :material
end
