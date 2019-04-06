class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :name
      t.text :content
      t.date :end_date

      t.timestamps
    end
  end
end
