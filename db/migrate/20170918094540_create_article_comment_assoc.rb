class CreateArticleCommentAssoc < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
CREATE VIEW article_comment_assoc AS
  SELECT
    c.username,
    c.body,
    c.created_at,
    ac.article_id,
    ac.comment_id,
    ca.parent_id,
    ca.child_id
  FROM comments c
  LEFT OUTER JOIN article_comments ac
  ON ac.comment_id = c.id
  LEFT OUTER JOIN comment_assocs ca
  ON ca.parent_id = c.id;
    SQL
  end

  def down
    execute <<-SQL
DROP VIEW IF EXISTS article_comment_assoc;
    SQL
  end
end
