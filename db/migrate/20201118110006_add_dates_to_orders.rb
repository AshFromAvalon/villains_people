class AddDatesToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :request_date, :date
    add_column :orders, :done_date, :date
    add_column :orders, :cancelled, :boolean, default: false
  end
end
