json.extract! content, :id, :title, :description, :slave, :image1_uid, :image1_name, :url, :sort, :created_at, :updated_at
json.url content_url(content, format: :json)
