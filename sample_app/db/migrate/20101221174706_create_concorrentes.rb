class CreateConcorrentes < ActiveRecord::Migration
  def self.up
    create_table :concorrentes do |t|
      t.string :nome
      t.string :num
      t.string :email
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :concorrentes
  end
end
