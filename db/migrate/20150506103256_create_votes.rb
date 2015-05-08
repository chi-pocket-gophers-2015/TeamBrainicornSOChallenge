class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.boolean :up
      t.references :voteable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
