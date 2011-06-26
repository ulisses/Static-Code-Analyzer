class AddCompileOutToTentativa < ActiveRecord::Migration
  def self.up
    add_column :tentativas, :compileOut, :string
  end

  def self.down
    remove_column :tentativas, :compileOut
  end
end
