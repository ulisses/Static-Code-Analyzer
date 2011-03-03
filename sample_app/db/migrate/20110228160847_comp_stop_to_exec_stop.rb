class CompStopToExecStop < ActiveRecord::Migration
  def self.up
    rename_column :tentativas, :compStop, :execStop
  end

  def self.down
    rename_column :tentativas, :execStop, :compStop
  end
end
