class AddLanguageToTentativa < ActiveRecord::Migration
  def self.up
    add_column :tentativas, :language_id, :int
  end

  def self.down
    remove_column :tentativas, :language_id
  end
end
