require 'rubygems'
require 'mongo_mapper'

class Cash
  include MongoMapper::Document

  key :session_id, String, :required => true
  key :session_value, String, :required => true

end
