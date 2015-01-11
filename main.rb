require 'sinatra'

class Secretary < Sinatra::Base

  Config = Struct.new(:data, :path)

  def self.load_config
  end
end
