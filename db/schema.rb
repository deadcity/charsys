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

ActiveRecord::Schema.define(version: 20150611183621) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliations", force: :cascade do |t|
    t.string   "name"
    t.integer  "character_type_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "attribute_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attributes", force: :cascade do |t|
    t.string   "name"
    t.integer  "attribute_category_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "character_has_attributes", force: :cascade do |t|
    t.integer  "attribute_id"
    t.integer  "character_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "character_has_skills", force: :cascade do |t|
    t.integer  "skill_id"
    t.integer  "character_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "character_types", force: :cascade do |t|
    t.string   "name"
    t.string   "power_stat"
    t.string   "resource"
    t.string   "morality"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "behavior_primary"
    t.string   "behavior_secondary"
  end

  create_table "characters", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "lineage_id"
    t.integer  "affiliation_id"
    t.string   "sublineage"
    t.string   "behavior_primary"
    t.string   "behavior_secondary"
    t.integer  "size"
    t.integer  "defense"
    t.integer  "initiative_mod"
    t.integer  "armor"
    t.integer  "speed"
    t.integer  "power_stat"
    t.integer  "morality"
    t.integer  "health"
    t.integer  "willpower"
    t.integer  "max_resource"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "character_type_id"
    t.integer  "chronicle_id"
  end

  create_table "chronicle_allows_character_types", force: :cascade do |t|
    t.integer  "chronicle_id"
    t.integer  "character_type_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "chronicles", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lineages", force: :cascade do |t|
    t.string   "name"
    t.integer  "character_type_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "power_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "character_type_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "powers", force: :cascade do |t|
    t.string   "name"
    t.integer  "rating"
    t.integer  "power_type_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "skill_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skill_specialties", force: :cascade do |t|
    t.string   "specialty"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.integer  "skill_category_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "user_administers_chronicles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "chronicle_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
