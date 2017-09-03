class CreateCommentAssocs < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_assocs do |t|
      t.bigint :parent_id, null: false
      t.bigint :child_id, null: false, unique: true

      t.timestamps
    end

    add_foreign_key :comment_assocs, :comments, column: :parent_id, name: 'comment_assocs_parent_id_fk'
    add_foreign_key :comment_assocs, :comments, column: :child_id, name: 'comment_assocs_child_id_fk'

    add_index :comment_assocs, [:parent_id, :child_id], unique: true
  end
end
