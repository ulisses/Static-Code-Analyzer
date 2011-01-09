class CreateParticipantes < ActiveRecord::Migration
  def self.up
    create_table :participantes do |t|
      t.integer :user_id
      t.integer :concurso_id
      t.date :dataRegisto

      t.timestamps
    end
  end

  def self.down
    drop_table :participantes
  end
end
