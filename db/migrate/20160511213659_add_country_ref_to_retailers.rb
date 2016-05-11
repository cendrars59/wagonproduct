class AddCountryRefToRetailers < ActiveRecord::Migration[5.0]
  def change
    add_reference :retailers, :country, foreign_key: true
  end
end
