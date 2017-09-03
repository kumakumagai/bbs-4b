class CreateArticleCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :article_categories do |t|
      t.bigint :article_id, null: false
      t.bigint :category_id, null: false

      t.timestamps
    end

    add_foreign_key :article_categories, :articles, column: :article_id, name: 'article_categories_article_id_fk'
    add_foreign_key :article_categories, :categories, column: :category_id, name: 'article_categories_category_id_fk'

    add_index :article_categories, [:article_id, :category_id], unique: true
  end
end
