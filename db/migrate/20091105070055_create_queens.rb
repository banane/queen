class CreateQueens < ActiveRecord::Migration
  def self.up
    create_table :queens do |t|
      t.string :name
      t.string :email
      t.string :kingdom

      t.timestamps
    end
  end

  def self.down
    drop_table :queens
  end
end
