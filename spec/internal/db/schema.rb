ActiveRecord::Schema.define do

  create_table "kms_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "ancestry"
    t.string   "slug"
    t.text     "description"
    t.string   "logo"
    t.integer  "position",        default: 0, null: false
    t.string   "seo_title"
    t.string   "seo_keywords"
    t.string   "seo_description"
    t.index ["ancestry"], name: "index_kms_categories_on_ancestry", using: :btree
    t.index ["slug"], name: "index_kms_categories_on_slug", unique: true, using: :btree
  end

  create_table "kms_categories_products", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "product_id"
    t.index ["category_id"], name: "index_kms_categories_products_on_category_id", using: :btree
    t.index ["product_id"], name: "index_kms_categories_products_on_product_id", using: :btree
  end

  create_table "kms_option_types", force: :cascade do |t|
    t.string   "tag"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kms_option_values", force: :cascade do |t|
    t.integer  "option_type_id"
    t.integer  "variant_id"
    t.string   "value"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["option_type_id"], name: "index_kms_option_values_on_option_type_id", using: :btree
    t.index ["variant_id"], name: "index_kms_option_values_on_variant_id", using: :btree
  end

  create_table "kms_product_option_types", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "option_type_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["option_type_id"], name: "index_kms_product_option_types_on_option_type_id", using: :btree
    t.index ["product_id"], name: "index_kms_product_option_types_on_product_id", using: :btree
  end

  create_table "kms_products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price",           precision: 12, scale: 2
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "slug"
    t.string   "image"
    t.string   "preview_image"
    t.string   "seo_title"
    t.string   "seo_keywords"
    t.string   "seo_description"
    t.index ["slug"], name: "index_kms_products_on_slug", unique: true, using: :btree
  end

  create_table "kms_properties", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.string   "tag"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kms_variants", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",      precision: 12, scale: 2
    t.integer  "product_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "image"
    t.index ["product_id"], name: "index_kms_variants_on_product_id", using: :btree
  end

end
