class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :title
      t.string :descript
      t.string :order_array

      t.timestamps
    end

    add_index :cats, [:title, :descript, :order_array]


  end
end
