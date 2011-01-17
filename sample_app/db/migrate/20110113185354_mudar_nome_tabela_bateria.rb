class MudarNomeTabelaBateria < ActiveRecord::Migration
  def self.up
        rename_table :baterias, :bateria_testes
    end 
    def self.down
        rename_table :bateria_testes , :baterias 
    end
end
