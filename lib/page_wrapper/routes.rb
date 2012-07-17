module ActionDispatch::Routing
  class Mapper
    def wrap_pages_for(*resource_names)
      resource_names.each do |name|
        match "/#{name}_pages" => PageWrapperController.action(:index), resource_name: name
      end
    end
  end
end
