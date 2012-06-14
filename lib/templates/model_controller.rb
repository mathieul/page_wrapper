class <%= class_name.camelize %>PagesController < ApplicationController
  def index
    page = <%= class_name.camelize %>Page.new(params)
    render json: [page]
  end
end
