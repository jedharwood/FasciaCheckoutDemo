class CreateMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :materials do |t|
      t.string :name
      t.text :description
      t.float :max_unit_length
      t.float :thickness
      t.float :width
      t.string :application
      t.string :water_tightness
      t.string :burglar_resistance

      t.timestamps
    end
  end
end
