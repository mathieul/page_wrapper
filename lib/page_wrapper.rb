require 'page_wrapper/version'
require 'page_wrapper/engine'
require 'page_wrapper/railtie'
require 'page_wrapper/model'
require 'page_wrapper/routes'

def PageWrapAs(resource_name, &block)
  resource_name = resource_name.to_s
  resource_names = resource_name.pluralize
  module_instance = Module.new
  module_instance.send(:define_method, :before_action) { block }
  klass = Class.new(PageWrapper::Model)
  klass.send(:define_method, resource_names) do
    instance_variable_get(:"@#{resource_names}")
  end
  klass.send(:define_method, :fetch_records) do |page, options|
    model_class = resource_name.classify.constantize
    items = model_class.paginated_query(page, options)
    instance_variable_set(:"@#{resource_name.pluralize}", items)
  end
  klass.extend(module_instance)
  Object.const_set("#{resource_name}_page".classify.to_sym, klass)
  module_instance
end
