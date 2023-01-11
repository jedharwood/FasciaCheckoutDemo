# frozen_string_literal: true

class CreateBasketMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :basket_materials do |t|
      t.references :material, null: false, foreign_key: true
      t.float :length

      t.timestamps
    end
  end
end
