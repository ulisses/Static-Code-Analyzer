class AddBestTimeToResults < ActiveRecord::Migration
  def self.up
    add_column :results, :bestTime, :float
  end

  def self.down
    remove_column :results, :bestTime
  end
end
