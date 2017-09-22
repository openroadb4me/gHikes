json.extract! track, :id, :name, :distance, :difficulty, :description, :image, :link, :completed, :created_at, :updated_at
json.url track_url(track, format: :json)
