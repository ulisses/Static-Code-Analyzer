class CreateLinguagems < ActiveRecord::Migration
  def self.up
    create_table :linguagems do |t|
      t.string :ling

      t.timestamps
    end
  end

  def self.down
    drop_table :linguagems
  end
end
