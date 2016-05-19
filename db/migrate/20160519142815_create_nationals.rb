class CreateNationals < ActiveRecord::Migration[5.0]
  def change
    create_table :nationals do |t|
      t.string :code
      t.string :label
      t.boolean :active
      t.string :description

      t.timestamps
    end
  end
end
