class CommentAssoc < ApplicationRecord
  belongs_to :parent_comment, class_name: 'Comment', foreign_key: :parent_id
  belongs_to :child_comment,  class_name: 'Comment', foreign_key: :child_id

  validates :parent_comment, presence: true
  validates :child_comment,  presence: true
end
