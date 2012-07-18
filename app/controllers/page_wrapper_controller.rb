class PageWrapperController < ApplicationController
  def index
    name = "#{params.delete(:resource_name)}_page"
    page_class = name.classify.constantize
    page = page_class.new(params)
    page.before_action.call(self) unless page.before_action.nil?
    render json: [page], root: name.pluralize
  end
end
