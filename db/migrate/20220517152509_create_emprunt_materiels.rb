class CreateEmpruntMateriels < ActiveRecord::Migration[7.0]
  def change
    create_table :emprunt_materiels do |t|
      t.integer :id_mat
      t.integer :id_adh

      t.timestamps
    end
  end
end
