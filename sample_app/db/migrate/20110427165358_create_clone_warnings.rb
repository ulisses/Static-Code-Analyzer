class CreateCloneWarnings < ActiveRecord::Migration
  def self.up
    create_table :clone_warnings do |t|
      t.integer :cardinality
      t.string :pathFile
      t.string :pathComp
      t.integer :concurso_id
      t.integer :enunciado_id

      t.timestamps
    end
  end

  def self.down
    drop_table :clone_warnings
  end
end
