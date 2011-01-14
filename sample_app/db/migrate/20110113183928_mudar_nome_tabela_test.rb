class MudarNomeTabelaTest < ActiveRecord::Migration
  def self.up
        rename_table :tests, :bateria_testes
    end 
    def self.down
        rename_table :bateria_testes, :tests
    end

end
