class CreateTelexes < ActiveRecord::Migration[5.0]
  def change
    create_table :telexes do |t|
      t.string :code
      t.string :title
      t.string :description
      t.datetime :end_validity
      t.boolean :active

      t.timestamps
    end
  end
end
