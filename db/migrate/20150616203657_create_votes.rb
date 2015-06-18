class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :song
      t.integer :vote_count
      t.timestamps
    end
  end
end