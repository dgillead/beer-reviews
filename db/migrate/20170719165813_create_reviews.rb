class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :review_text, null: false
      t.integer :beer_id
      t.integer :user_id
      
      t.timestamps
    end
  end
end
