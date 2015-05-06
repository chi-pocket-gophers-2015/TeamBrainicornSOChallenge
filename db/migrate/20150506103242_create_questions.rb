class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :content
      t.belongs_to :user
      t.integer :best_answer_id
      t.timestamps
    end
  end
end
