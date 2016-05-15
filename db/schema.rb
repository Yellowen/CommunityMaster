# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160514100346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "application_models", force: :cascade do |t|
    t.string   "model"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faalis_blog_categories", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "permalink"
    t.boolean  "members_only", default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.uuid     "site_id"
  end

  add_index "faalis_blog_categories", ["site_id"], name: "index_faalis_blog_categories_on_site_id", using: :btree

  create_table "faalis_blog_posts", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "title"
    t.string   "permalink"
    t.text     "raw_content"
    t.text     "content"
    t.uuid     "category_id"
    t.uuid     "user_id"
    t.boolean  "published"
    t.boolean  "allow_comments",   default: true
    t.boolean  "members_only",     default: false
    t.string   "meta_title"
    t.string   "meta_description"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.uuid     "site_id"
  end

  add_index "faalis_blog_posts", ["category_id"], name: "index_faalis_blog_posts_on_category_id", using: :btree
  add_index "faalis_blog_posts", ["site_id"], name: "index_faalis_blog_posts_on_site_id", using: :btree

  create_table "faalis_comments", force: :cascade do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "title"
    t.text     "body"
    t.string   "subject"
    t.integer  "user_id",          null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faalis_comments", ["commentable_id", "commentable_type"], name: "index_faalis_comments_on_commentable_id_and_commentable_type", using: :btree
  add_index "faalis_comments", ["user_id"], name: "index_faalis_comments_on_user_id", using: :btree

  create_table "faalis_groups", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faalis_groups", ["role"], name: "index_faalis_groups_on_role", unique: true, using: :btree

  create_table "faalis_groups_permissions", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid "permission_id"
    t.uuid "group_id"
  end

  create_table "faalis_groups_users", force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "group_id"
  end

  add_index "faalis_groups_users", ["user_id", "group_id"], name: "by_user_and_group", unique: true, using: :btree

  create_table "faalis_media_files", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "faalis_media_images", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "caption"
    t.text     "subcaption"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "faalis_media_videos", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "caption"
    t.text     "subcaption"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
  end

  create_table "faalis_page_menus", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "title"
    t.boolean  "published",  default: false
    t.uuid     "user_id"
    t.json     "data"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.uuid     "site_id"
  end

  add_index "faalis_page_menus", ["site_id"], name: "index_faalis_page_menus_on_site_id", using: :btree

  create_table "faalis_page_pages", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "title"
    t.string   "layout",       default: "layouts/page"
    t.string   "description"
    t.string   "tags"
    t.string   "permalink"
    t.uuid     "user_id"
    t.text     "raw_content"
    t.text     "content"
    t.boolean  "members_only", default: false
    t.boolean  "published",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "site_id"
  end

  add_index "faalis_page_pages", ["permalink"], name: "index_faalis_page_pages_on_permalink", using: :btree
  add_index "faalis_page_pages", ["site_id"], name: "index_faalis_page_pages_on_site_id", using: :btree

  create_table "faalis_permissions", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "model"
    t.string   "permission_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faalis_permissions", ["model"], name: "index_faalis_permissions_on_model", using: :btree

  create_table "faalis_shop_categories", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "permalink"
    t.boolean  "lock",         default: true
    t.boolean  "members_only", default: false
    t.uuid     "parent_id"
    t.uuid     "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.uuid     "site_id"
  end

  add_index "faalis_shop_categories", ["permalink"], name: "index_faalis_shop_categories_on_permalink", using: :btree
  add_index "faalis_shop_categories", ["site_id"], name: "index_faalis_shop_categories_on_site_id", using: :btree

  create_table "faalis_shop_products", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.integer  "category_id"
    t.boolean  "lock"
    t.boolean  "private"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.uuid     "parent_id"
    t.uuid     "user_id"
    t.uuid     "site_id"
  end

  add_index "faalis_shop_products", ["site_id"], name: "index_faalis_shop_products_on_site_id", using: :btree

  create_table "faalis_user_messages", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "sender_id"
    t.uuid     "receiver_id"
    t.boolean  "read_only"
    t.text     "content"
    t.text     "raw_content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faalis_user_messages", ["receiver_id"], name: "index_faalis_user_messages_on_receiver_id", using: :btree
  add_index "faalis_user_messages", ["sender_id"], name: "index_faalis_user_messages_on_sender_id", using: :btree

  create_table "faalis_users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faalis_users", ["email"], name: "index_faalis_users_on_email", unique: true, using: :btree
  add_index "faalis_users", ["reset_password_token"], name: "index_faalis_users_on_reset_password_token", unique: true, using: :btree
  add_index "faalis_users", ["unlock_token"], name: "index_faalis_users_on_unlock_token", unique: true, using: :btree

  create_table "namespaces", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.boolean  "locked",      default: false
    t.string   "name"
    t.text     "description"
    t.uuid     "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "podcasts_episodes", force: :cascade do |t|
    t.string   "title"
    t.integer  "number"
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "ogg_file_name"
    t.string   "ogg_content_type"
    t.integer  "ogg_file_size"
    t.datetime "ogg_updated_at"
    t.string   "mp3_file_name"
    t.string   "mp3_content_type"
    t.integer  "mp3_file_size"
    t.datetime "mp3_updated_at"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.uuid     "site_id"
  end

  add_index "podcasts_episodes", ["number"], name: "index_podcasts_episodes_on_number", using: :btree
  add_index "podcasts_episodes", ["site_id"], name: "index_podcasts_episodes_on_site_id", using: :btree

  create_table "podcasts_links", force: :cascade do |t|
    t.string   "title"
    t.string   "href"
    t.text     "desc"
    t.integer  "episode_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid     "site_id"
  end

  add_index "podcasts_links", ["site_id"], name: "index_podcasts_links_on_site_id", using: :btree

  create_table "podcasts_participants", force: :cascade do |t|
    t.string   "name"
    t.text     "bio"
    t.string   "twitter"
    t.string   "github"
    t.string   "website"
    t.string   "linkedin"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid     "site_id"
  end

  add_index "podcasts_participants", ["site_id"], name: "index_podcasts_participants_on_site_id", using: :btree

  create_table "podcasts_parties", force: :cascade do |t|
    t.integer  "episode_id"
    t.integer  "participant_id"
    t.boolean  "host",           default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.uuid     "site_id"
  end

  add_index "podcasts_parties", ["site_id"], name: "index_podcasts_parties_on_site_id", using: :btree

  create_table "site_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "site_framework_domains", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name"
    t.uuid     "site_id"
    t.uuid     "parent_id"
    t.boolean  "alias",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "namespace_id"
    t.uuid     "user_id"
  end

  add_index "site_framework_domains", ["name"], name: "index_site_framework_domains_on_name", unique: true, using: :btree

  create_table "site_framework_sites", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "default_template", default: ""
    t.integer  "user_id"
    t.boolean  "locked"
    t.json     "settings"
    t.integer  "site_category_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.uuid     "site_id"
  end

  add_index "taggings", ["site_id"], name: "index_taggings_on_site_id", using: :btree
  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.uuid    "site_id"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree
  add_index "tags", ["site_id"], name: "index_tags_on_site_id", using: :btree

end
