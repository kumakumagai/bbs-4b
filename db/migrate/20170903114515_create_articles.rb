class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title, limit: 100, null: false
      t.string :body, limit: 5000, null: false

      t.timestamps
    end
  end
end
