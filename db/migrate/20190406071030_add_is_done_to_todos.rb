class AddIsDoneToTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :is_done, :boolean, default:0
  end
end
