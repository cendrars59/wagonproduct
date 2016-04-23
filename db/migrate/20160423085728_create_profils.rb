class CreateProfils < ActiveRecord::Migration[5.0]
  def change
    create_table :profils do |t|
      t.string :code
      t.string :label
      t.boolean :is_active
      t.string :description
      t.string :string

      t.timestamps
    end
  end
end
