class AddReserveToMateriel < ActiveRecord::Migration[7.0]
  def change
    add_column :materiels, :reserve, :integer
  end
end
