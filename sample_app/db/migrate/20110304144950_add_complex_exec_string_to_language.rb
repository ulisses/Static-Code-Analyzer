class AddComplexExecStringToLanguage < ActiveRecord::Migration
  def self.up
     add_column :languages, :complexExecString, :string
  end

  def self.down
     remove_column :languages, :complexExecString    
  end
end
