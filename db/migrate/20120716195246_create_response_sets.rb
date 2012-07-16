class CreateResponseSets < ActiveRecord::Migration
  def change
    create_table :response_sets do |t|
      t.integer :client_id
      t.integer :test_id

      t.timestamps
    end
  end
end
