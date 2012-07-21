class Initial < ActiveRecord::Migration

	def change
		create_table :clients do |t|
			t.string   :code
			t.timestamps
		end

		create_table :master_tests do |t|
			t.string  :name
			t.text    :instructions
			t.boolean :random
			t.timestamps
		end

		create_table :question_groups do |t|
			t.references :master_test
			t.string     :name
			t.timestamps
		end
		add_index :question_groups, :master_test_id

		create_table :questions do |t|
			t.references :question_group
			t.string     :content
			t.timestamps
		end
		add_index :questions, :question_group_id

		create_table :answers do |t|
			t.references :question
			t.string     :content
			t.integer    :value
			t.timestamps
		end
		add_index :answers, :question_id

		create_table :tests do |t|
			t.references :client
			t.references :master_test
			t.timestamps
		end
		add_index :tests, :client_id
		add_index :tests, :master_test_id

		create_table :response_groups do |t|
			t.references :test
			t.references :question_group
			t.timestamps
		end
		add_index :response_groups, :test_id
		add_index :response_groups, :question_group_id

		create_table :responses do |t|
			t.references :response_group
			t.references :question
			t.references :answer
			t.timestamps
		end
		add_index :responses, :response_group_id
		add_index :responses, :question_id
		add_index :responses, :answer_id
	end
end
