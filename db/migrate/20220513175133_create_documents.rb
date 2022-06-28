class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string :type
      t.string :titre
      t.string :auteur
      t.integer :isbn

      t.timestamps
    end
  end
end
