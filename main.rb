require 'faye'
require 'multi_json'
require 'oj'
require 'sinatra'
require 'yaml'

class WhimsyApp < Sinatra::Base

  def self.load_config
    file = 'config.yaml'
    if File.exist? file
      @@config = OpenStruct.new(Psych.load(File.read(file)))
    else
      raise Exeception.new("Unable to read #{file}")
    end
  end

  def self.config
    @@config
  end

  # Enable websocket requests to be read/sent through the /faye path
  # This only uses an in-memory store which should be fine for Secretary
  # If not, switch to using Redis
  use Faye::RackAdapter, mount: '/faye', timeout: 25

  configure do
    load_config
  end

  # Load all of the routes
  Dir["#{File.dirname(File.absolute_path(__FILE__))}/routes/*.rb"].each {|file| require file}

  # start the server if ruby file executed directly
  run! if app_file == $0
end
