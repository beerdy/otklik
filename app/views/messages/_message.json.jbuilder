json.extract! message, :id, :name, :email, :phone, :description, :document_uid, :document_name, :url, :sort, :created_at, :updated_at
json.url message_url(message, format: :json)
