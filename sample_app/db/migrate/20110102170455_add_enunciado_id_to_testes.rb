class AddEnunciadoIdToTestes < ActiveRecord::Migration
  def self.up
    add_column :testes, :enunciado_id, :integer
  end

  def self.down
    remove_column :testes, :enunciado_id, :integer
  end
end
