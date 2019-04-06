json.extract! todo, :id, :name, :content, :end_date, :created_at, :updated_at
json.url todo_url(todo, format: :json)
