class RemoveStringToProfils < ActiveRecord::Migration[5.0]
  def change
    remove_column :profils, :string, :string
  end
end
