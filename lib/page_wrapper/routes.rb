module ActionDispatch::Routing
  class Mapper
    def wrap_pages_for(*resource_names)
      resource_names.each do |name|
        match "/#{name}_pages", to: "#{name.to_s.pluralize}#index"
      end
    end
  end
end
