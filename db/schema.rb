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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120509002653) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "order"
    t.boolean  "active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories_companies", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "company_id"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "owner"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.date     "date_opened"
    t.string   "email"
    t.string   "phone"
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "youtube"
    t.text     "hours_of_operation"
    t.string   "industry"
    t.boolean  "active",             :default => true
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "comment"
  end

  create_table "coupons", :force => true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.text     "description"
    t.text     "disclaimer"
    t.text     "terms"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "coupons", ["company_id"], :name => "index_coupons_on_company_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "year"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposals", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "location"
    t.text     "bio"
    t.string   "links"
    t.string   "github"
    t.string   "twitter"
    t.text     "speaker_cv"
    t.text     "video_links"
    t.text     "notes"
    t.text     "new_talk"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "snippets", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sponsors", :force => true do |t|
    t.integer  "event_id"
    t.integer  "sponsorship_level_id"
    t.string   "name"
    t.text     "description"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sponsors", ["event_id"], :name => "index_sponsors_on_event_id"
  add_index "sponsors", ["sponsorship_level_id"], :name => "index_sponsors_on_sponsorship_level_id"

  create_table "sponsorship_levels", :force => true do |t|
    t.integer  "event_id"
    t.string   "name"
    t.string   "status"
    t.integer  "maximum"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sponsorship_levels", ["event_id"], :name => "index_sponsorship_levels_on_event_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",     :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",     :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                                  :default => "user"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
