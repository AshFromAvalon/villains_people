class CreateCrimes < ActiveRecord::Migration[6.0]
  def change
    create_table :crimes do |t|
      t.string :name
      t.string :category
      t.integer :price
      t.string :currency
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
