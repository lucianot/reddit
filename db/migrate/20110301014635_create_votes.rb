class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer :value, :default => 0
      t.references :user
      t.references :link

      t.timestamps
    end
  end

  def self.down
    drop_table :votes
  end
end
