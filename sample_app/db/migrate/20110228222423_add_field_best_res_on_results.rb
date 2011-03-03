class AddFieldBestResOnResults < ActiveRecord::Migration
  def self.up
    add_column :results, :bestRes, :float
  end

  def self.down
  end
end
