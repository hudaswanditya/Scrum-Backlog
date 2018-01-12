json.extract! story, :id, :name, :sprint, :description, :label, :complete, :created_at, :updated_at
json.url story_url(story, format: :json)
