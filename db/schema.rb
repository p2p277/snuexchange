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

ActiveRecord::Schema.define(version: 20151126071651) do

  create_table "messages", force: :cascade do |t|
    t.integer  "sender"
    t.integer  "receiver"
    t.string   "content"
    t.boolean  "flags"
    t.boolean  "sender_destroy"
    t.boolean  "receiver_destroy"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "postcomments", force: :cascade do |t|
    t.integer  "post_id",                   null: false
    t.integer  "user_id",                   null: false
    t.text     "text",                      null: false
    t.boolean  "flag",       default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id",                   null: false
    t.string   "title",                     null: false
    t.text     "text",                      null: false
    t.integer  "count",      default: 0
    t.boolean  "flag",       default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "usercomments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "commenter_id"
    t.string   "content"
    t.integer  "score"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "gender"
    t.string   "language_learn"
    t.string   "language_speak"
    t.string   "brief"
    t.text     "introductiondeetail"
    t.string   "facebook_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "confirmation_token"
<<<<<<< HEAD
    t.datetime "confirmed_at"
=======
    t.datetime "confirmed_at",           default: '2015-12-03 08:51:02'
>>>>>>> 9668b463012b0e97369ee82ece8217b15ec8f4ab
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
