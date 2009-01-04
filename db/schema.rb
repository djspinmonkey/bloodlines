# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081120020550) do

  create_table "character_races", :force => true do |t|
    t.integer  "character_id"
    t.integer  "race_id"
    t.integer  "parts"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_traits", :force => true do |t|
    t.integer  "character_id"
    t.integer  "trait_id"
    t.integer  "race_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.string   "gender"
    t.integer  "house_id"
    t.integer  "spouse_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "marriage_id"
    t.integer  "parents_id"
    t.integer  "age"
  end

  create_table "houses", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "marriages", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "races", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "races_traits", :id => false, :force => true do |t|
    t.integer "race_id"
    t.integer "trait_id"
  end

  create_table "trait_prerequisites", :id => false, :force => true do |t|
    t.integer "trait_id"
    t.integer "prerequisite_id"
  end

  create_table "traits", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bonuses"
  end

end
