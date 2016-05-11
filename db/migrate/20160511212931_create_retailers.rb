class CreateRetailers < ActiveRecord::Migration[5.0]
  def change
    create_table :retailers do |t|
      t.string :code
      t.string :label
      t.string :description
      t.string :active
      t.string :boolean

      t.timestamps
    end
  end
end
