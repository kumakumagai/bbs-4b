class CreateArticleComments < ActiveRecord::Migration[5.1]
  def change
    create_table :article_comments do |t|
      t.bigint :article_id, null: false
      t.bigint :comment_id, null: false

      t.timestamps
    end

    add_foreign_key :article_comments, :articles, column: :article_id, name: 'article_comments_article_id_fk'
    add_foreign_key :article_comments, :tags, column: :comment_id, name: 'article_comments_comment_id_fk'

    add_index :article_comments, [:article_id, :comment_id], unique: true
  end
end
