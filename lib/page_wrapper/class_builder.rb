require 'active_model_serializers'

module PageWrapper
  class ClassBuilder
    def initialize(name, &block)
      @name, @block = name.to_s, block
    end

    def make_wrapper_module
      module_instance = Module.new
      module_instance.send(:define_method, :before_action) { @block }
      module_instance
    end

    def make_page_model(module_instance)
      name, names = @name, @name.pluralize
      klass = Class.new(PageWrapper::Model)
      klass.send(:define_method, names) do
        instance_variable_get(:"@#{names}")
      end
      klass.send(:define_method, :fetch_records) do |page, options|
        model_class = name.classify.constantize
        items = model_class.paginated_query(page, options)
        instance_variable_set(:"@#{names.pluralize}", items)
      end
      klass.extend(module_instance)
      Object.const_set("#{name}_page".classify.to_sym, klass)
    end

    def make_page_serializer
      names = @name.pluralize.to_sym
      klass = Class.new(ActiveModel::Serializer) do
        embed :ids, include: true
        attributes :id, :pages, :first, :last, :total, :per_page, :query, :sort, :dir
        has_many names
      end
      Object.const_set("#{@name}_page_serializer".classify.to_sym, klass)
    end
  end
end
