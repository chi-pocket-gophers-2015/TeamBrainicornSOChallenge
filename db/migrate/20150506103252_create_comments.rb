class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.belongs_to :user
      t.references :commentable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
