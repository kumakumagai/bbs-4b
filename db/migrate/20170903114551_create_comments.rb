class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :username, limit: 64
      t.string :body, limit: 1000, null: false

      t.timestamps
    end
  end
end
