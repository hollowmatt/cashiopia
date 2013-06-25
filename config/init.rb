require 'rubygems'
require 'yaml'
require 'mongo_mapper'
require 'log_buddy'

@config = YAML.load_file("config/database.yml")

@environment = @config["environment"]

@db_host = @config[@environment]["host"]
@db_port = @config[@environment]["port"]
@db_name = @config[@environment]["database"]
@db_log = @config[@environment]["logfile"]

# Configure the environment

log_dir = File.expand_path('../log/', __FILE__)
FileUtils.mkdir_p(log_dir) unless File.exist?(log_dir)
logger = Logger.new(log_dir + @db_log)

LogBuddy.init(:logger => logger)
MongoMapper.connection = Mongo::Connection.new(@db_host, @db_port, :logger => logger)
MongoMapper.database = @db_name

MongoMapper.connection.connect
