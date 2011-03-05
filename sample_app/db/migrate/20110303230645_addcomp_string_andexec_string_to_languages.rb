class AddcompStringAndexecStringToLanguages < ActiveRecord::Migration
  def self.up
    add_column :languages, :compString, :string
    add_column :languages, :execString, :string    
  end

  def self.down
    remove_column :languages, :compString
    remove_column :languages, :execString
  end
end
