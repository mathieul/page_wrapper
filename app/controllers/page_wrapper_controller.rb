class PageWrapperController < ApplicationController
  def index
    name = "#{params.delete(:resource_name)}_page"
    page_class = name.classify.constantize
    page = page_class.new(params)
    render json: [page], root: name.pluralize
  end
end
