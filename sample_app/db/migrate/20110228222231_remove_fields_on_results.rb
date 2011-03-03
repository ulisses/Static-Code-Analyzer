class RemoveFieldsOnResults < ActiveRecord::Migration
  def self.up
    remove_column :results, :bateria_id
    remove_column :results, :output
    remove_column :results, :tentativa_id        
  end

  def self.down
  end
end
