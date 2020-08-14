class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String
  field :slave, type: String
  field :link, type: String
  field :url, type: String
  field :sort, type: Integer
  field :show, type: Mongoid::Boolean
end
