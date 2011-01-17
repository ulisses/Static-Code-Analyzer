class CreateResults < ActiveRecord::Migration
  def self.up
    create_table :results do |t|
      t.integer :test_id
      t.integer :tentativa_id
      t.string :output

      t.timestamps
    end
  end

  def self.down
    drop_table :results
  end
end
