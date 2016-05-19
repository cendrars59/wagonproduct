class AddRetailerToNationals < ActiveRecord::Migration[5.0]
  def change
    add_reference :nationals, :retailer, foreign_key: true
  end
end
