class ChangeResult < ActiveRecord::Migration
  def self.up
    add_column :results, :user_id, :int
    add_column :results, :concurso_id, :int    
    add_column :results, :enunciado_id, :int    
    remove_column :results, :bateria_id
    remove_column :results, :output
    remove_column :results, :tentativa_id        
  end

  def self.down
  end
end
