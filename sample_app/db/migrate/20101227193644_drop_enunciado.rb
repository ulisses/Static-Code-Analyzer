class DropEnunciado < ActiveRecord::Migration
  def self.up
    drop_table :enunciados
  end

  def self.down
  end
end
