class Todo < ApplicationRecord
  mount_uploader :image_url, ImageUploader

  def self.search(search)
    if search == "done"
      Todo.where(is_done: true)
    elsif search
      Todo.where(['(content LIKE ?) OR (name LIKE ?)', "%#{search}%", "%#{search}%"]).where(is_done: false)
    else
      Todo.all.where(is_done: false)
    end
  end
end
