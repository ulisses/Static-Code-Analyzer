class RemoveDurToConcurso < ActiveRecord::Migration
  def self.up
    remove_column :concursos, :dur
  end

  def self.down
    add_column :concursos, :dur, :integer
  end
end
