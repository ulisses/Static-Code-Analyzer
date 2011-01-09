class RenameTable < ActiveRecord::Migration
  def self.up
         rename_table :funcaos, :functions
     end 
     def self.down

     end
end
