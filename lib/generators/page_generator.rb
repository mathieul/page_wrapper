module PageWrapper
  class PageGenerator < ::Rails::Generators::NamedBase
    source_root File.expand_path("../../templates", __FILE__)

    desc "Creates a new page to wrap a resource collection"

    def create_page_files
      model_path = File.join('app/models', class_path, "#{file_name}_page.rb")
      template 'model_page.rb', model_path

      serializer_path = File.join('app/serializers', class_path, "#{file_name}_page_serializer.rb")
      template 'model_serializer.rb', serializer_path

      controller_path = File.join('app/controllers', class_path, "#{file_name}_pages_controller.rb")
      template 'model_controller.rb', controller_path

      route "resources :#{class_name.underscore}_pages, only: [:index]"

      controller_path = File.join('app/assets/javascripts/controllers', class_path, "#{file_name}_page_controller.js.coffee")
      template 'page_controller.js.coffee', controller_path

      model_path = File.join('app/assets/javascripts/models', class_path, "#{file_name}_page.js.coffee")
      template 'page_model.js.coffee', model_path

      template_path = File.join('app/assets/javascripts/templates', class_path, "#{file_name}_page.handlebars")
      template 'page_template.handlebars', template_path

      view_path = File.join('app/assets/javascripts/views', class_path, "#{file_name}_page.js.coffee")
      template 'page_view.js.coffee', view_path
    end

    def show_readme
      readme "README" if behavior == :invoke
    end
  end
end
