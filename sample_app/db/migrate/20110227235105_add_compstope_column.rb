class AddCompstopeColumn < ActiveRecord::Migration
  def self.up
    add_column :tentativas, :compStop,    :boolean
    add_column :tentativas, :passedTests,    :float
  end

  def self.down
    remove_column :tentativas, :compStop
    remove_column :tentativas, :passedTests
    
  end
end
