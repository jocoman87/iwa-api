class AddTotalQuestionsTodos < ActiveRecord::Migration[6.0]
  def change
    add_column :todos, :total_question, :integer
  end
end
