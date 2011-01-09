class RenameTableL < ActiveRecord::Migration
  def self.up
         rename_table :linguagems, :languages
     end

  def self.down
  end
end
