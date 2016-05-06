class RemoveStringToCountries < ActiveRecord::Migration[5.0]
  def change
    remove_column :countries, :string, :string
  end
end
