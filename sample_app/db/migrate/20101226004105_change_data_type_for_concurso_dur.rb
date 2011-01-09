class ChangeDataTypeForConcursoDur < ActiveRecord::Migration
  def self.up
    change_table :concursos do |t|
          t.change :dur, :time
    end
  end

  def self.down
  end
end
