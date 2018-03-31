class Message
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :phone, type: String
  field :description, type: String
  field :document_uid, type: String
  field :document_name, type: String
  field :url, type: String
  field :sort, type: Integer

  validates :email,
            presence: true,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
end
