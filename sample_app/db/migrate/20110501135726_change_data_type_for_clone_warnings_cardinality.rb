class ChangeDataTypeForCloneWarningsCardinality < ActiveRecord::Migration
  def self.up
    change_table :clone_warnings do |t|
          t.change :cardinality, :float
    end
  end

  def self.down
    change_table :clone_warnings do |t|
          t.change :cardinality, :integer
    end
  end
end
