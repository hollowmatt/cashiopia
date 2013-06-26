require 'rubygems'
require 'mongo_mapper'

class Cash
  include MongoMapper::Document

  key :session_id, String, :required => true
  key :session_value, String, :required => true
  #key :session_ttl, Time, :required => true

  def to_s
    "key: " + self.session_id + ", value: " + self.session_value
  end
end
