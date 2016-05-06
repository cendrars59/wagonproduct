class AddDescriptionToCountries < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :description, :string
    add_column :countries, :string, :string
  end
end
