class CreateFuncaos < ActiveRecord::Migration
  def self.up
    create_table :funcaos do |t|
      t.string :func

      t.timestamps
    end
  end

  def self.down
    drop_table :funcaos
  end
end
