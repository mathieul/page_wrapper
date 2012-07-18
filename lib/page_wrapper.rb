require 'page_wrapper/version'
require 'page_wrapper/engine'
require 'page_wrapper/railtie'
require 'page_wrapper/model'
require 'page_wrapper/routes'
require 'page_wrapper/class_builder'

def PageWrapAs(resource_name, &block)
  builder = PageWrapper::ClassBuilder.new(resource_name, &block)
  the_module = builder.make_wrapper_module
  builder.make_page_model(the_module)
  builder.make_page_serializer
  the_module
end
