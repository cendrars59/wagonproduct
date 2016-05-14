class AddMastertoCategories < ActiveRecord::Migration[5.0]
  def change
  	add_column :categories, :master, :boolean
  end
end
