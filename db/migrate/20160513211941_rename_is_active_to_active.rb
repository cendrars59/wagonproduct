class RenameIsActiveToActive < ActiveRecord::Migration[5.0]
  def change
  	rename_column :categories, :is_active, :active
  	rename_column :groups, :is_active, :active
  	rename_column :profils, :is_active, :active
  end
end
