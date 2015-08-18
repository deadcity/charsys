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

ActiveRecord::Schema.define(version: 20150818173201) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attribs", force: :cascade do |t|
    t.string   "name"
    t.integer  "attribute_category_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "attribute_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "character_has_attributes", force: :cascade do |t|
    t.integer  "attrib_id"
    t.integer  "character_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "value",        default: 1
  end

  create_table "character_has_merit", force: :cascade do |t|
    t.integer "character_id"
    t.integer "merit_id"
    t.string  "specification"
    t.text    "description"
    t.integer "rating"
  end

  create_table "character_has_skills", force: :cascade do |t|
    t.integer  "skill_id"
    t.integer  "character_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "value",        default: 0
  end

  create_table "character_type_has_affiliation", force: :cascade do |t|
    t.integer "character_type_id"
    t.integer "affiliation_id"
  end

  create_table "character_type_has_lineage", force: :cascade do |t|
    t.integer "character_type_id"
    t.integer "lineage_id"
  end

  create_table "character_type_has_power_types", force: :cascade do |t|
    t.integer "character_type_id"
    t.integer "power_type_id"
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
    t.string   "question1"
    t.string   "question2"
    t.string   "question3"
    t.string   "question4"
    t.string   "question5"
    t.string   "question6"
    t.string   "question7"
    t.string   "question8"
    t.string   "lineage"
    t.string   "affiliation"
    t.string   "sublineage"
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
    t.integer  "armor_ballistic"
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
    t.string   "misc"
    t.text     "answer1"
    t.text     "answer2"
    t.text     "answer3"
    t.text     "answer4"
    t.text     "answer5"
    t.text     "answer6"
    t.text     "answer7"
    t.text     "answer8"
    t.integer  "armor_general"
    t.text     "st_notes"
    t.text     "printed_notes"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "merits", force: :cascade do |t|
    t.string  "name"
    t.boolean "has_specification"
    t.boolean "has_description"
    t.string  "allowed_ratings"
  end

  create_table "power_groups", force: :cascade do |t|
    t.string  "name"
    t.integer "power_type_id"
  end

  create_table "power_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "user_is_admins", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
