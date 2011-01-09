class RemoveInicioToConcurso < ActiveRecord::Migration
  def self.up
    remove_column :concursos, :inicio
  end

  def self.down
    add_column :concursos, :inicio, :date
  end
end
