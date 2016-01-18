class TinyUrl
  include Mongoid::Document
  
  field :url, :type => String
  field :shorten_key, :type => String
  
  validates_presence_of :url, :shorten_key
end
