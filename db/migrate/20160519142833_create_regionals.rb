class CreateRegionals < ActiveRecord::Migration[5.0]
  def change
    create_table :regionals do |t|
      t.string :code
      t.string :label
      t.boolean :active
      t.string :description

      t.timestamps
    end
  end
end
