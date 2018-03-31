class Content
  include Mongoid::Document
  include Mongoid::Paperclip
  has_mongoid_attached_file :image1
  validates_attachment_content_type :image1, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  field :title, type: String
  field :description, type: String
  field :slave, type: String
  #field :image1_uid, type: String
  #field :image1_name, type: String
  field :url, type: String
  field :sort, type: Integer
end
