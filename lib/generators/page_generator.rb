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
    end
  end
end
