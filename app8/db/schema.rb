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

ActiveRecord::Schema.define(version: 20161120113404) do

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "plan_id"
    t.integer  "customer_id"
    t.string   "desc"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_comments_on_customer_id", using: :btree
  end

  create_table "coms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "com_name",   null: false
    t.string   "contact",    null: false
    t.string   "address",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "cust_name",  null: false
    t.string   "email",      null: false
    t.string   "contact",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "plan_name",  null: false
    t.integer  "max_tenure", null: false
    t.integer  "roi",        null: false
    t.integer  "bonus",      null: false
    t.integer  "com_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["com_id"], name: "index_plans_on_com_id", using: :btree
  end

  create_table "pols", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "plan_id"
    t.integer  "customer_id"
    t.integer  "sum_insured"
    t.integer  "duration"
    t.integer  "premium"
    t.string   "nominee"
    t.integer  "maturity_amount"
    t.date     "maturity_date"
    t.string   "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["customer_id"], name: "index_pols_on_customer_id", using: :btree
  end

  add_foreign_key "comments", "customers"
  add_foreign_key "plans", "coms"
  add_foreign_key "pols", "customers"
end
