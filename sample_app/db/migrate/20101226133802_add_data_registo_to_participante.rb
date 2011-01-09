class AddDataRegistoToParticipante < ActiveRecord::Migration
  def self.up
    add_column :participantes, :dataRegisto, :datetime
  end

  def self.down
    remove_column :participantes, :dataRegisto
  end
end
