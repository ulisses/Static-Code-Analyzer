class TExecColumnAdded < ActiveRecord::Migration
  def self.up
    add_column :tentativas, :tExec, :float
  end

  def self.down
    remove_column :tentativas, :tExec    
  end
end
