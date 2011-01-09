class CreateEnunciados < ActiveRecord::Migration
  def self.up
    create_table :enunciados do |t|
      t.string :titulo
      t.string :desc
      t.integer :funcao_id
      t.integer :peso
      t.integer :linguagem_id
      t.integer :concurso_id

      t.timestamps
    end
  end

  def self.down
    drop_table :enunciados
  end
end
