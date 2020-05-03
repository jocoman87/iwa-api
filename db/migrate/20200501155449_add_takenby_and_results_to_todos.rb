class AddTakenbyAndResultsToTodos < ActiveRecord::Migration[6.0]
  def change
    add_column :todos, :taken_by, :string
    add_column :todos, :results, :integer
  end
end
