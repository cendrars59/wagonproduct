class RemoveStringToCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :string, :string
  end
end
