class CreateMasks < ActiveRecord::Migration[6.0]
  def change
    create_table :masks do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
