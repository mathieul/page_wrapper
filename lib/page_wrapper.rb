require 'page_wrapper/version'
require 'page_wrapper/engine'
require 'page_wrapper/railtie'
require 'page_wrapper/model'
require 'page_wrapper/routes'
require 'page_wrapper/class_builder'

module PageWrapper
  def wrap_in_page(options = {})
    resource_name = to_s.underscore
    builder = PageWrapper::ClassBuilder.new(resource_name, options)
    builder.make_page_model
    builder.make_page_serializer
    self
  end
end
