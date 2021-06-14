class CreateTools < ActiveRecord::Migration[6.0]
  def change
    create_table :tools do |t|
      t.string :tool_name
      t.text :tool_description
      t.text :address
      t.float :longitude
      t.float :latitude
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
