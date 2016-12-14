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

ActiveRecord::Schema.define(version: 20161203065325) do

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "plan_id",     null: false
    t.string   "description", null: false
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_comments_on_customer_id", using: :btree
  end

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "company_name", null: false
    t.string   "contact",      null: false
    t.string   "address",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "customer_name", null: false
    t.string   "email",         null: false
    t.string   "contact",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "plans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "plan_name",  null: false
    t.integer  "max_tenure", null: false
    t.integer  "interest",   null: false
    t.integer  "bonus",      null: false
    t.integer  "min_amount", null: false
    t.integer  "max_amount", null: false
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_plans_on_company_id", using: :btree
  end

  create_table "policies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "plan_id",         null: false
    t.integer  "sum_insured",     null: false
    t.integer  "duration",        null: false
    t.integer  "premium",         null: false
    t.string   "nominee",         null: false
    t.string   "premium_mode",    null: false
    t.integer  "maturity_amount", null: false
    t.date     "maturity_date",   null: false
    t.string   "status"
    t.integer  "customer_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["customer_id"], name: "index_policies_on_customer_id", using: :btree
  end

  add_foreign_key "comments", "customers"
  add_foreign_key "plans", "companies"
  add_foreign_key "policies", "customers"
end
