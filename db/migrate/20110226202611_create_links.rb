class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.string :url, :null => false
      t.string :title, :null => false
      t.text :description
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :links
  end
end
