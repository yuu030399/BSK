class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :product_name,null: false
      t.integer :user_id,null: false
      t.integer :category_id,null: false
      t.float   :rate,null: false
      t.integer :amount,null: false
      t.timestamps
    end
  end
end
