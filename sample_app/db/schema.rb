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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110113200625) do

  create_table "baterias", :force => true do |t|
    t.string   "nome"
    t.string   "input"
    t.string   "output"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "enunciado_id"
  end

  create_table "concorrentes", :force => true do |t|
    t.string   "nome"
    t.string   "num"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "concursos", :force => true do |t|
    t.string   "tit"
    t.string   "chave"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "inicio"
    t.datetime "fim"
    t.time     "dur"
  end

  create_table "enunciado_langs", :force => true do |t|
    t.integer  "enunciado_id"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enunciados", :force => true do |t|
    t.string   "titulo"
    t.string   "desc"
    t.integer  "funcao_id"
    t.integer  "peso"
    t.integer  "concurso_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "functions", :force => true do |t|
    t.string   "func"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", :force => true do |t|
    t.string   "ling"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participantes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "concurso_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "dataRegisto"
  end

  create_table "results", :force => true do |t|
    t.integer  "bateria_id"
    t.integer  "tentativa_id"
    t.string   "output"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tentativas", :force => true do |t|
    t.integer  "user_id"
    t.string   "path"
    t.boolean  "compilou"
    t.integer  "enunciado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",              :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
