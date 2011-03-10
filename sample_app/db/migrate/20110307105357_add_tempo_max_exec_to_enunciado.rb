class AddTempoMaxExecToEnunciado < ActiveRecord::Migration
  def self.up
    add_column :enunciados, :maxTempExec, :float
  end

  def self.down
    remove_column :enunciados, :maxTempExec
  end
end
