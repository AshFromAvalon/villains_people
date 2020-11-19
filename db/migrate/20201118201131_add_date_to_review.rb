class AddDateToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :post_date, :date
  end
end
