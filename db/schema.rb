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

ActiveRecord::Schema.define(version: 20150504214411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.integer "price",     null: false
    t.integer "ticket_id", null: false
    t.integer "user_id",   null: false
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string  "description", null: false
    t.integer "ticket_id",   null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer "date", null: false
    t.integer "time", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string  "description", null: false
    t.integer "user_id",     null: false
    t.integer "chatroom_id", null: false
  end

  create_table "private_messages", force: :cascade do |t|
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "eventdate",   null: false
    t.integer "eventtime",   null: false
    t.integer "postdate",    null: false
    t.integer "enddate",     null: false
    t.integer "price",       null: false
    t.integer "chatroom_id", null: false
    t.integer "bid_id",      null: false
    t.integer "user_id",     null: false
  end

end
