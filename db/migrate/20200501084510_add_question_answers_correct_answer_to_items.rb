class AddQuestionAnswersCorrectAnswerToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :question, :string
    add_column :items, :answers, :text
    add_column :items, :correct, :string
  end
end
