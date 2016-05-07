class AddCountryToCountries < ActiveRecord::Migration[5.0]
  def change
    add_reference :countries, :country, foreign_key: true
  end
end
