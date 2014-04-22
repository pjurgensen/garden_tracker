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

ActiveRecord::Schema.define(version: 20140422012227) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "garden_tasks", force: true do |t|
    t.text     "description"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "completed"
  end

  create_table "recurring_tasks", force: true do |t|
    t.text     "description"
    t.integer  "frequency"
    t.date     "reference_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
