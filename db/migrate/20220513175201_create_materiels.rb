class CreateMateriels < ActiveRecord::Migration[7.0]
  def change
    create_table :materiels do |t|
      t.string :marque
      t.string :os
      t.integer :material_id

      t.timestamps
    end
  end
end
