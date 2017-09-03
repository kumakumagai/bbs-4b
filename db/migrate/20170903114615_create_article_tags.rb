class CreateArticleTags < ActiveRecord::Migration[5.1]
  def change
    create_table :article_tags do |t|
      t.bigint :article_id, null: false
      t.bigint :tag_id, null: false

      t.timestamps
    end

    add_foreign_key :article_tags, :articles, column: :article_id, name: 'article_tags_article_id_fk'
    add_foreign_key :article_tags, :tags, column: :tag_id, name: 'article_tags_tag_id_fk'

    add_index :article_tags, [:article_id, :tag_id], unique: true
  end
end
