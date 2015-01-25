require 'erb'

require 'mail'
require 'sinatra/base'

module Sinatra::Utils
  class Email

    def initialize(method = :sendmail)
      Mail.defaults do
        delivery_method method
      end
    end

    def signature(user)
      case user
      when 'clr'
        [from: 'Craig L Russell <clr@apache.org>',
         sig: %Q{\n-- Craig L Russell\nSecretary, Apache Software Foundation}]
      when 'jcarman'
        [from: 'James Carman <jcarman@apache.org>',
         sig: %Q{\n-- James Carman\nAssistant Secretary, Apache Software Foundation}]
      when 'rubys'
        [from: 'Sam Ruby <rubys@apache.org>',
         sig: %Q{\n-- Sam Ruby\nApache Software Foundation Secretarial Team}]
      when 'sanders'
        [from: 'Scott Sander <sanders@apache.org>',
         sig: %Q{\n-- Scott Sander\nApache Software Foundation Secretarial Team }]
      when 'mnour'
        [from: 'Mohammad Nour El-Din <mnour@apache.org>',
         sig: %{\n-- Mohammad Nour El-Din\nApache Software Foundation Secretarial Team}]
      end
    end
  end
end
