class RemoveStringToGroups < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :string, :string
  end
end
