class RenameTests < ActiveRecord::Migration
	def up
		remove_index :tests, :client_id
		remove_index :tests, :master_test_id
		rename_table :tests, :assignments
		add_index :assignments, :client_id
		add_index :assignments, :master_test_id

		remove_index :response_groups, :test_id
		rename_column :response_groups, :test_id, :assignment_id
		add_index :response_groups, :assignment_id
	end

	def down
		remove_index :assignments, :client_id
  	remove_index :assignments, :master_test_id
		rename_table :assignments, :tests
		add_index :tests, :client_id
		add_index :tests, :master_test_id

		remove_index :response_groups, :assignment_id
		rename_column :response_groups, :assignment_id, :test_id
		add_index :response_groups, :test_id
	end	
end
