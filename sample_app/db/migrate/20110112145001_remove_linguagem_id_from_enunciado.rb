class RemoveLinguagemIdFromEnunciado < ActiveRecord::Migration
  def self.up
    remove_column :enunciados, :linguagem_id
  end

  def self.down
    add_column :enunciados, :linguagem_id, :integer
  end
end
