class AddNationalRefToRegionals < ActiveRecord::Migration[5.0]
  def change
  	add_reference :regionals, :national, foreign_key: true
  end
end
