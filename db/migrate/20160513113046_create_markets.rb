class CreateMarkets < ActiveRecord::Migration[5.0]
  def change
    create_table :markets do |t|
      t.string :code
      t.string :label
      t.boolean :active
      t.string :description

      t.timestamps
    end
  end
end
