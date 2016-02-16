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

ActiveRecord::Schema.define(version: 20160216145246) do

  create_table "application_models", force: :cascade do |t|
    t.string   "model"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.integer  "domain_id"
    t.index ["commentable_id", "commentable_type"], name: "index_faalis_comments_on_commentable_id_and_commentable_type"
    t.index ["domain_id"], name: "index_faalis_comments_on_domain_id"
    t.index ["user_id"], name: "index_faalis_comments_on_user_id"
  end

  create_table "faalis_groups", force: :cascade do |t|
    t.string   "name"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["role"], name: "index_faalis_groups_on_role", unique: true
  end

  create_table "faalis_groups_permissions", force: :cascade do |t|
    t.integer "permission_id"
    t.integer "group_id"
  end

  create_table "faalis_groups_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.index ["user_id", "group_id"], name: "by_user_and_group", unique: true
  end

  create_table "faalis_permissions", force: :cascade do |t|
    t.string   "model"
    t.string   "permission_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["model"], name: "index_faalis_permissions_on_model"
  end

  create_table "faalis_users", force: :cascade do |t|
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
    t.index ["email"], name: "index_faalis_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_faalis_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_faalis_users_on_unlock_token", unique: true
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
    t.integer  "domain_id"
    t.index ["domain_id"], name: "index_podcasts_episodes_on_domain_id"
    t.index ["number"], name: "index_podcasts_episodes_on_number"
  end

  create_table "podcasts_links", force: :cascade do |t|
    t.string   "title"
    t.string   "href"
    t.text     "desc"
    t.integer  "episode_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "domain_id"
    t.index ["domain_id"], name: "index_podcasts_links_on_domain_id"
  end

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
    t.integer  "domain_id"
    t.index ["domain_id"], name: "index_podcasts_participants_on_domain_id"
  end

  create_table "podcasts_parties", force: :cascade do |t|
    t.integer  "episode_id"
    t.integer  "participant_id"
    t.boolean  "host",           default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "domain_id"
    t.index ["domain_id"], name: "index_podcasts_parties_on_domain_id"
  end

  create_table "site_framework_domains", force: :cascade do |t|
    t.string   "name"
    t.integer  "site_id"
    t.integer  "parent_id"
    t.boolean  "alias",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_site_framework_domains_on_name", unique: true
  end

  create_table "site_framework_sites", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "default_template", default: ""
  end

end
