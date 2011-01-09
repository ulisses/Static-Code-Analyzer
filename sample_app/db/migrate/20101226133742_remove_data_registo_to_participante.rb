class RemoveDataRegistoToParticipante < ActiveRecord::Migration
  def self.up
    remove_column :participantes, :dataRegisto
  end

  def self.down
    add_column :participantes, :dataRegisto, :date
  end
end
