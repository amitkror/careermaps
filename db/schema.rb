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

ActiveRecord::Schema.define(version: 20140630174735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.text     "text"
    t.integer  "order",       default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "career_jobs", force: true do |t|
    t.integer  "career_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "career_jobs", ["career_id"], name: "index_career_jobs_on_career_id", using: :btree
  add_index "career_jobs", ["job_id"], name: "index_career_jobs_on_job_id", using: :btree

  create_table "careers", force: true do |t|
    t.string   "name",                          null: false
    t.text     "short_description"
    t.text     "about_the_field"
    t.text     "a_good_fit"
    t.string   "slug",                          null: false
    t.integer  "order",             default: 1
    t.integer  "status_id",         default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "education_levels", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_education_levels", force: true do |t|
    t.integer  "education_level_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_education_levels", ["education_level_id"], name: "index_job_education_levels_on_education_level_id", using: :btree
  add_index "job_education_levels", ["job_id"], name: "index_job_education_levels_on_job_id", using: :btree

  create_table "jobs", force: true do |t|
    t.string   "name"
    t.string   "slug",                                null: false
    t.integer  "status_id",           default: 1
    t.text     "copy"
    t.text     "duties"
    t.text     "pay"
    t.boolean  "hot_industry",        default: false
    t.boolean  "needs_certification", default: false
    t.integer  "answer_1_id"
    t.integer  "answer_2_id"
    t.integer  "answer_3_id"
    t.integer  "answer_4_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "title",                              null: false
    t.string   "short_title"
    t.string   "slug",                               null: false
    t.string   "redirect_to"
    t.text     "copy"
    t.text     "copy_top"
    t.text     "meta_description"
    t.integer  "status_id",          default: 1
    t.integer  "order",              default: 1
    t.boolean  "locked",             default: false
    t.boolean  "in_nav",             default: false
    t.boolean  "password_protected", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.text     "title"
    t.integer  "order",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thumbs", force: true do |t|
    t.string   "uid"
    t.string   "signature"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
