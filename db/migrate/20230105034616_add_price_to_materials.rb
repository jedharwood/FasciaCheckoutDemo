# frozen_string_literal: true

class AddPriceToMaterials < ActiveRecord::Migration[7.0]
  def change
    add_monetize :materials, :price, amount: { null: true, default: nil }, currency: { null: true, default: nil }
  end
end
