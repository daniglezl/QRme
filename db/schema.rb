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

ActiveRecord::Schema.define(version: 20170326010751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string   "name"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_attachments_on_event_id", using: :btree
  end

  create_table "attendances", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_instance_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["event_instance_id"], name: "index_attendances_on_event_instance_id", using: :btree
    t.index ["user_id"], name: "index_attendances_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body",            null: false
    t.integer  "user_id"
    t.integer  "forum_thread_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_comments_on_ancestry", using: :btree
    t.index ["forum_thread_id"], name: "index_comments_on_forum_thread_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "event_instances", force: :cascade do |t|
    t.integer  "event_id"
    t.datetime "date",       null: false
    t.text     "location",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_instances_on_event_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",                   null: false
    t.integer  "recurrent",  default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "forum_threads", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_forum_threads_on_event_id", using: :btree
    t.index ["user_id"], name: "index_forum_threads_on_user_id", using: :btree
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_invitations_on_event_id", using: :btree
    t.index ["user_id"], name: "index_invitations_on_user_id", using: :btree
  end

  create_table "poll_answers", force: :cascade do |t|
    t.integer  "poll_id"
    t.string   "title"
    t.integer  "voteCount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poll_id"], name: "index_poll_answers_on_poll_id", using: :btree
  end

  create_table "polls", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_polls_on_event_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "roles_mask"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "attachments", "events"
  add_foreign_key "attendances", "event_instances"
  add_foreign_key "attendances", "users"
  add_foreign_key "comments", "forum_threads"
  add_foreign_key "comments", "users"
  add_foreign_key "event_instances", "events"
  add_foreign_key "events", "users"
  add_foreign_key "forum_threads", "events"
  add_foreign_key "forum_threads", "users"
  add_foreign_key "invitations", "events"
  add_foreign_key "invitations", "users"
  add_foreign_key "poll_answers", "polls"
  add_foreign_key "polls", "events"
end
