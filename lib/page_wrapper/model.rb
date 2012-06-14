require 'active_model_serializers'

module PageWrapper
  class Model
    include ActiveModel::AttributeMethods
    include ActiveModel::SerializerSupport

    attr_reader :attributes

    def self.fields
      [:id, :pages, :first, :last, :total, :per_page, :query, :sort, :dir]
    end
    define_attribute_methods fields.map(&:to_s)

    fields.each do |name|
      define_method(name) { attributes[name] }
      define_method(:"#{name}=") { |value| attributes[name] = value }
    end

    def per_page_default
      10
    end

    def per_page_max
      100
    end

    def initialize(params)
      page = params[:id].to_i
      options = get_options_from(params)
      records = fetch_records(page, options)
      @attributes = options.merge(
        id:    records.current_page,
        pages: records.num_pages,
        first: records.first_page?,
        last:  records.last_page?,
        total: records.total_count
      )
    end

    def fetch_records(page, options)
      raise "Overide me"
    end

    def get_options_from(params)
      per_page = [params.fetch(:per_page, per_page_default).to_i, per_page_max].min
      params.slice(:query, :sort, :dir).merge(per_page: per_page)
    end
  end
end
