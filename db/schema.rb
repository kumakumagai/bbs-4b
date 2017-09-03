# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170903145123) do

  create_table "article_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "article_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id", "category_id"], name: "index_article_categories_on_article_id_and_category_id", unique: true
    t.index ["category_id"], name: "article_categories_category_id_fk"
  end

  create_table "article_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "article_id", null: false
    t.bigint "comment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id", "comment_id"], name: "index_article_comments_on_article_id_and_comment_id", unique: true
    t.index ["comment_id"], name: "index_article_comments_on_comment_id", unique: true
  end

  create_table "article_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "article_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id", "tag_id"], name: "index_article_tags_on_article_id_and_tag_id", unique: true
    t.index ["tag_id"], name: "article_tags_tag_id_fk"
  end

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", limit: 100, null: false
    t.string "body", limit: 5000, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comment_assocs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "parent_id", null: false
    t.bigint "child_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "comment_assocs_child_id_fk"
    t.index ["parent_id", "child_id"], name: "index_comment_assocs_on_parent_id_and_child_id", unique: true
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "username", limit: 64
    t.string "body", limit: 1000, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "article_categories", "articles", name: "article_categories_article_id_fk"
  add_foreign_key "article_categories", "categories", name: "article_categories_category_id_fk"
  add_foreign_key "article_comments", "articles", name: "article_comments_article_id_fk"
  add_foreign_key "article_comments", "tags", column: "comment_id", name: "article_comments_comment_id_fk"
  add_foreign_key "article_tags", "articles", name: "article_tags_article_id_fk"
  add_foreign_key "article_tags", "tags", name: "article_tags_tag_id_fk"
  add_foreign_key "comment_assocs", "comments", column: "child_id", name: "comment_assocs_child_id_fk"
  add_foreign_key "comment_assocs", "comments", column: "parent_id", name: "comment_assocs_parent_id_fk"
end
