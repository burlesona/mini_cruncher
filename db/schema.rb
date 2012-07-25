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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120725153415) do

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.string   "content"
    t.integer  "value"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"

  create_table "assignments", :force => true do |t|
    t.integer  "client_id"
    t.integer  "master_test_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "assignments", ["client_id"], :name => "index_assignments_on_client_id"
  add_index "assignments", ["master_test_id"], :name => "index_assignments_on_master_test_id"

  create_table "clients", :force => true do |t|
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "master_tests", :force => true do |t|
    t.string   "name"
    t.text     "instructions"
    t.boolean  "random"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "question_groups", :force => true do |t|
    t.integer  "master_test_id"
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "question_groups", ["master_test_id"], :name => "index_question_groups_on_master_test_id"

  create_table "questions", :force => true do |t|
    t.integer  "question_group_id"
    t.string   "content"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "questions", ["question_group_id"], :name => "index_questions_on_question_group_id"

  create_table "response_groups", :force => true do |t|
    t.integer  "assignment_id"
    t.integer  "question_group_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "response_groups", ["assignment_id"], :name => "index_response_groups_on_assignment_id"
  add_index "response_groups", ["question_group_id"], :name => "index_response_groups_on_question_group_id"

  create_table "responses", :force => true do |t|
    t.integer  "response_group_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "responses", ["answer_id"], :name => "index_responses_on_answer_id"
  add_index "responses", ["question_id"], :name => "index_responses_on_question_id"
  add_index "responses", ["response_group_id"], :name => "index_responses_on_response_group_id"

end
