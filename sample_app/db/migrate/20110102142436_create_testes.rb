class CreateTestes < ActiveRecord::Migration
  def self.up
    create_table :testes do |t|
      t.string :nome
      t.string :input
      t.string :output

      t.timestamps
    end
  end

  def self.down
    drop_table :testes
  end
end
