# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_17_152509) do
  create_table "adherents", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.integer "adh_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "type"
    t.string "titre"
    t.string "auteur"
    t.integer "isbn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emprunt_docs", force: :cascade do |t|
    t.integer "isbn_livre"
    t.integer "id_adh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emprunt_documents", force: :cascade do |t|
    t.integer "isbn_livre"
    t.integer "id_adh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emprunt_materiels", force: :cascade do |t|
    t.integer "id_mat"
    t.integer "id_adh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materiels", force: :cascade do |t|
    t.string "marque"
    t.string "os"
    t.integer "material_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reserve"
  end

end
