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

ActiveRecord::Schema.define(version: 20160914050102) do

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

  create_table "behavior_primaries", force: :cascade do |t|
    t.string "name"
  end

  create_table "behavior_secondaries", force: :cascade do |t|
    t.string "name"
  end

  create_table "character_has_attributes", force: :cascade do |t|
    t.integer  "attrib_id"
    t.integer  "character_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "value",        default: 1
  end

  create_table "character_has_flaws", force: :cascade do |t|
    t.integer "flaw_id"
    t.integer "character_id"
    t.string  "specification"
    t.text    "description"
  end

  create_table "character_has_merits", force: :cascade do |t|
    t.integer "character_id"
    t.integer "merit_id"
    t.string  "specification"
    t.text    "description"
    t.integer "rating"
  end

  create_table "character_has_powers", force: :cascade do |t|
    t.integer  "character_id"
    t.integer  "power_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_has_skills", force: :cascade do |t|
    t.integer  "skill_id"
    t.integer  "character_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "value",        default: 0
  end

  create_table "character_type_has_affiliations", force: :cascade do |t|
    t.integer "character_type_id"
    t.integer "affiliation_id"
  end

  create_table "character_type_has_behavior_primaries", force: :cascade do |t|
    t.integer "character_type_id"
    t.integer "behavior_primary_id"
  end

  create_table "character_type_has_behavior_secondaries", force: :cascade do |t|
    t.integer "character_type_id"
    t.integer "behavior_secondary_id"
  end

  create_table "character_type_has_lineages", force: :cascade do |t|
    t.integer "character_type_id"
    t.integer "lineage_id"
  end

  create_table "character_types", force: :cascade do |t|
    t.string   "name"
    t.string   "power_stat"
    t.string   "resource"
    t.string   "morality"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
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
    t.string   "flaw_name"
    t.boolean  "status",             default: true
    t.boolean  "has_touchstone"
  end

  create_table "character_types_power_types", force: :cascade do |t|
    t.integer "character_type_id"
    t.integer "power_type_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "lineage_id"
    t.integer  "affiliation_id"
    t.string   "sublineage"
    t.integer  "size"
    t.integer  "defense"
    t.integer  "initiative_mod"
    t.integer  "armor_ballistic"
    t.integer  "speed"
    t.integer  "power_stat",            default: 1
    t.integer  "morality",              default: 7
    t.integer  "health",                default: 6
    t.integer  "willpower",             default: 2
    t.integer  "max_resource",          default: 10
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
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
    t.integer  "status",                default: 0
    t.integer  "intelligence",          default: 1
    t.integer  "wits",                  default: 1
    t.integer  "resolve",               default: 1
    t.integer  "strength",              default: 1
    t.integer  "dexterity",             default: 1
    t.integer  "stamina",               default: 1
    t.integer  "presence",              default: 1
    t.integer  "manipulation",          default: 1
    t.integer  "composure",             default: 1
    t.integer  "academics",             default: 0
    t.integer  "computer",              default: 0
    t.integer  "crafts",                default: 0
    t.integer  "investigation",         default: 0
    t.integer  "medicine",              default: 0
    t.integer  "occult",                default: 0
    t.integer  "politics",              default: 0
    t.integer  "science",               default: 0
    t.integer  "athletics",             default: 0
    t.integer  "brawl",                 default: 0
    t.integer  "drive",                 default: 0
    t.integer  "firearms",              default: 0
    t.integer  "larceny",               default: 0
    t.integer  "stealth",               default: 0
    t.integer  "survival",              default: 0
    t.integer  "weaponry",              default: 0
    t.integer  "animal_ken",            default: 0
    t.integer  "empathy",               default: 0
    t.integer  "expression",            default: 0
    t.integer  "intimidation",          default: 0
    t.integer  "persuasion",            default: 0
    t.integer  "socialize",             default: 0
    t.integer  "streetwise",            default: 0
    t.integer  "subterfuge",            default: 0
    t.integer  "behavior_primary_id"
    t.integer  "behavior_secondary_id"
    t.text     "wishlist"
    t.text     "touchstones",           default: ""
    t.text     "integrity_modifiers",   default: ""
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

  create_table "chronicles_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "chronicle_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "downtime_actions", force: :cascade do |t|
    t.integer "character_id"
    t.integer "game_id"
    t.string  "title"
    t.string  "points_spent"
    t.string  "assets"
    t.text    "description"
    t.text    "response"
    t.boolean "submitted",    default: false
  end

  create_table "flaws", force: :cascade do |t|
    t.integer "character_type_id"
    t.string  "name"
    t.text    "description"
    t.boolean "requires_specification"
    t.boolean "requires_description"
  end

  create_table "games", force: :cascade do |t|
    t.integer "chronicle_id"
    t.integer "game_number"
    t.string  "title"
    t.boolean "active",       default: false
  end

  create_table "lineages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "merit_categories", force: :cascade do |t|
    t.string "merit_category"
  end

  create_table "merits", force: :cascade do |t|
    t.string  "name"
    t.boolean "has_specification"
    t.boolean "has_description"
    t.string  "allowed_ratings"
    t.integer "merit_category_id"
    t.boolean "status"
  end

  create_table "power_groups", force: :cascade do |t|
    t.string  "name"
    t.integer "power_type_id"
    t.boolean "status",        default: true
  end

  create_table "power_groups_types", force: :cascade do |t|
    t.integer "power_type_id"
    t.integer "power_group_id"
  end

  create_table "power_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "status"
  end

  create_table "powers", force: :cascade do |t|
    t.string   "name"
    t.integer  "power_group_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "rating"
    t.boolean  "status",         default: true
  end

  create_table "skill_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skill_specialties", force: :cascade do |t|
    t.string   "specialty"
    t.integer  "skill_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "character_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.integer  "skill_category_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
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
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "xp_records", force: :cascade do |t|
    t.integer  "character_id"
    t.integer  "amount"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
