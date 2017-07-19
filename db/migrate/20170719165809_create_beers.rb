class CreateBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :type_of_beer
      t.float :alchohol_content

      t.timestamps
    end
  end
end
