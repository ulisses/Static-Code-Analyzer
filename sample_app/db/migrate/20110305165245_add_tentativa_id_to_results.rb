class AddTentativaIdToResults < ActiveRecord::Migration
  def self.up
    add_column :results, :tentativa_id, :integer
  end

  def self.down
    remove_column :results, :tentativa_id    
  end
end
