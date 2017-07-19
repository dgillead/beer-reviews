class CreateBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :beers do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.float :alchohol_content, null: false
      
      t.timestamps
    end
  end
end
