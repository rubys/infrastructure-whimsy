require 'sinatra'
require 'yaml'

class WhimsyApp < Sinatra::Base

  def self.load_config(file)
    if File.exist? file
      @@config = OpenStruct.new(Psych.load(File.read(file)))
    else
      raise Exeception.new("Unable to read #{file}")
    end
  end

  def self.config
    @@config
  end

  configure do
  end

  # Load all of the routes
  Dir["#{File.dirname(File.absolute_path(__FILE__))}/routes/*.rb"].each {|file| require file}

  # start the server if ruby file executed directly
  run! if app_file == $0
end
