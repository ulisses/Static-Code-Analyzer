class CreateEnunciadoLangs < ActiveRecord::Migration
  def self.up
    create_table :enunciado_langs do |t|
      t.integer :enunciado_id
      t.integer :language_id

      t.timestamps
    end
  end

  def self.down
    drop_table :enunciado_langs
  end
end
