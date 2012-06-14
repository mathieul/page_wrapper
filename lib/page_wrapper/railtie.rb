require 'rails'

module PageWrapper
  class Railtie < ::Rails::Railtie
    generators do |app|
      app ||= ::Rails.application # Rails 3.0.x does not yield `app`

      # app.config.generators.assets = false

      # ::Rails::Generators.configure!(app.config.generators)
      # ::Rails::Generators.hidden_namespaces.uniq!
      # require "generators/ember/resource_override"
    end
  end
end
