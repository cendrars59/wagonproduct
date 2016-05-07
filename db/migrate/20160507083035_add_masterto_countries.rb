class AddMastertoCountries < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :master, :boolean, default: false
  end
end
