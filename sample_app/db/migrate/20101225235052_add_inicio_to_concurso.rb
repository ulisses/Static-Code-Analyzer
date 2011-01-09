class AddInicioToConcurso < ActiveRecord::Migration
  def self.up
    add_column :concursos, :inicio, :datetime
  end

  def self.down
    remove_column :concursos, :inicio
  end
end
