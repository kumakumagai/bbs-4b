class ModifyArticleCommentsCommentIdForeinKey < ActiveRecord::Migration[5.1]
  def up
    remove_foreign_key :article_comments, :tags
    add_foreign_key :article_comments, :comments, column: :comment_id, name: 'article_comments_comment_id_fk'
  end

  def down
    remove_foreign_key :article_comments, :comments
    add_foreign_key :article_comments, :tags, column: :comment_id, name: 'article_comments_comment_id_fk'
  end
end
