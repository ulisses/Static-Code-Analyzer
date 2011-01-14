class MudarNomeTabelaBateriaTestes < ActiveRecord::Migration
  def self.up
        rename_table :bateria_testes, :baterias 
    end 
    def self.down
        rename_table :baterias , :bateria_testes
    end
end
