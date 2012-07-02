class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :code

      t.timestamps
    end
  end
end
