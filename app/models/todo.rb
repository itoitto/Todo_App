class Todo < ApplicationRecord
  def self.search(search)
    if search
      Todo.where(['(content LIKE ?) or (name LIKE ?)', "%#{search}%", "%#{search}%"])
    else
      Todo.all
    end
  end
end
