require 'sinatra/base'

# TODO This should probably be merged with the ASF::SVN class at some point
module Sinatra::Utils
  class Svn

    attr_reader :path
    def initialize(path)
      @path = path
    end

  end
end
