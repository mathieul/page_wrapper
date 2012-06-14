require 'rails'

module PageWrapper
  class Railtie < ::Rails::Railtie
    generators do |app|
      require "generators/page_generator"
    end
  end
end
