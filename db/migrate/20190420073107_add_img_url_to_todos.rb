class AddImgUrlToTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :image_url, :string
  end
end
