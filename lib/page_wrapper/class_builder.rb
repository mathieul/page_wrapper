require 'active_model_serializers'

module PageWrapper
  class ClassBuilder
    def initialize(name, options)
      @name = name
      @before_action = options[:before_action]
    end

    def make_page_model
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
      hook = @before_action
      klass.send(:define_method, :before_action) { hook }
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
