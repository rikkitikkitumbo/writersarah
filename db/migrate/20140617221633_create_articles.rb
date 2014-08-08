class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :article_link
      t.string :descript
      t.integer :cat_id
      t.string :cat_title

      t.timestamps
    end

    add_index :articles, [:title]
  end

end
