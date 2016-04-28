class AddCountryToCategories < ActiveRecord::Migration[5.0]
  def change
    add_reference :categories, :country, foreign_key: true
  end
end
