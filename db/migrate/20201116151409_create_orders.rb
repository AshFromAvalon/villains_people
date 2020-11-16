class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.text :description
      t.boolean :validated
      t.boolean :done
      t.boolean :paid
      t.references :user, null: false, foreign_key: true
      t.references :crime, null: false, foreign_key: true

      t.timestamps
    end
  end
end
