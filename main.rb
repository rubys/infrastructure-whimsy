require 'logger'
require 'multi_json'
require 'oj'
require 'sinatra'
require 'yaml'

class WhimsyApp < Sinatra::Base

  def self.load_config
    file = 'config/config.yaml'
    dev_redis = 'config/redis.development'
    if File.exist? file
      @@config = OpenStruct.new(Psych.load(File.read(file)))
      
      if WhimsyApp.development?
        redis_config = Psych.load(File.read(dev_redis))
        @@config[:redis] = redis_config
      end
    else
      raise Exeception.new("Unable to read #{file}")
    end
  end

  def self.config
    @@config
  end
  
  configure do
    load_config
    @@logger = Logger.new(STDOUT)
  end

  Dir["#{File.dirname(File.absolute_path(__FILE__))}/middleware/*.rb"].each {|file| require file}
  use Rack::WebSocketHandler

  # Load all of the routes
  Dir["#{File.dirname(File.absolute_path(__FILE__))}/routes/*.rb"].each {|file| require file}

  # start the server if ruby file executed directly
  run! if app_file == $0
end
