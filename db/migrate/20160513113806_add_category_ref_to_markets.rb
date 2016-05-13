class AddCategoryRefToMarkets < ActiveRecord::Migration[5.0]
  def change
    add_reference :markets, :category, foreign_key: true
  end
end
