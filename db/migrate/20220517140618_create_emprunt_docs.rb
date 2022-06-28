class CreateEmpruntDocs < ActiveRecord::Migration[7.0]
  def change
    create_table :emprunt_docs do |t|
      t.integer :isbn_livre
      t.integer :id_adh

      t.timestamps
    end
  end
end
