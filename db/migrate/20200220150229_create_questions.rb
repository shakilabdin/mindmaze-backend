class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :question
      t.belongs_to :category, null: false, foreign_key: true
      t.string :correct_choice
      t.string :first_incorrect
      t.string :second_incorrect
      t.string :third_incorrect
      t.string :difficulty

      t.timestamps
    end
  end
end
