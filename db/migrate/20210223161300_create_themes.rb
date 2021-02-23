class CreateThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :themes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.integer :price_cent
      t.integer :rating
      t.integer :number_people

      t.timestamps
    end
  end
end
