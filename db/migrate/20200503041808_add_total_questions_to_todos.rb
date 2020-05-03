class AddTotalQuestionsToTodos < ActiveRecord::Migration[6.0]
  def change
    add_column :todos, :total_questions, :integer
  end
end
