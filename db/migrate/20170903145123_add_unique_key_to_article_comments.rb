class AddUniqueKeyToArticleComments < ActiveRecord::Migration[5.1]
  def change
    add_index :article_comments, :comment_id, unique: true
  end
end
