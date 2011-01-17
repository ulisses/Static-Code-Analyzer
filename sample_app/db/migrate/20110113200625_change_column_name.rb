class ChangeColumnName < ActiveRecord::Migration
  def self.up
       rename_column :results, :test_id, :bateria_id 
     end

     def self.down
     end

end
