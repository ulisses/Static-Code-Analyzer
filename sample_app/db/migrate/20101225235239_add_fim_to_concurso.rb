class AddFimToConcurso < ActiveRecord::Migration
  def self.up
    add_column :concursos, :fim, :datetime
  end

  def self.down
    remove_column :concursos, :fim
  end
end
