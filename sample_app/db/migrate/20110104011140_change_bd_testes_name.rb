class ChangeBdTestesName < ActiveRecord::Migration
    def self.up
     rename_table :testes, :tests
   end 
 def self.down
     rename_table :tests, :testes
 end
end
