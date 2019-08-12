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

ActiveRecord::Schema.define(version: 2019_03_15_200533) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer "grupo", null: false
    t.date "data_evento", null: false
    t.string "tipo"
    t.string "titulo", null: false
    t.string "local_realizacao_atividade", null: false
    t.text "relatorio", null: false
    t.bigint "user_id"
    t.float "hora_computada", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.text "feedback"
    t.string "edited_by"
    t.json "documents"
    t.string "nome_grupo"
    t.string "nome_usuario"
    t.string "nome_do_evento"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "duvidas", force: :cascade do |t|
    t.string "duvida"
    t.string "resposta"
  end

  create_table "eventos", force: :cascade do |t|
    t.string "noticia"
    t.string "noticia_foto"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome", null: false
    t.string "matricula", null: false
    t.string "licenciatura", null: false
    t.string "inicio_ano", null: false
    t.string "termino_ano", null: false
    t.integer "role", default: 0
    t.string "cargahoraria"
    t.string "cargahoraria_total"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "users"
end
