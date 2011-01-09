class CreateTentativas < ActiveRecord::Migration
  def self.up
    create_table :tentativas do |t|
      t.integer :user_id
      t.string :path
      t.boolean :compilou
      t.integer :enunciado_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tentativas
  end
end
