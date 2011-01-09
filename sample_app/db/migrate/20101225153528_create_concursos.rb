class CreateConcursos < ActiveRecord::Migration
  def self.up
    create_table :concursos do |t|
      t.string :tit
      t.string :chave
      t.date :inicio
      t.date :fim
      t.integer :dur
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :concursos
  end
end
