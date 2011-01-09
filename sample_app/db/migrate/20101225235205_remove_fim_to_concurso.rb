class RemoveFimToConcurso < ActiveRecord::Migration
  def self.up
    remove_column :concursos, :fim
  end

  def self.down
    add_column :concursos, :fim, :date
  end
end
