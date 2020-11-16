class ChangeOrderBooleanDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:orders, :validated, false)
    change_column_default(:orders, :done, false)
    change_column_default(:orders, :paid, false)
  end
end
