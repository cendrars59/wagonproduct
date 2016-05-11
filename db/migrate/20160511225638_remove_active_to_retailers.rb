class RemoveActiveToRetailers < ActiveRecord::Migration[5.0]
  def change
    remove_column :retailers, :active, :string
  end
end
