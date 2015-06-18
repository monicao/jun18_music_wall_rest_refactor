class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.belongs_to :user
      t.string :title
      t.string :author
      t.string :url
      t.timestamps
    end
  end
end
