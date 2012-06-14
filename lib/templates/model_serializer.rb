class <%= class_name.camelize %>PageSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :pages, :first, :last, :total, :per_page, :query, :sort, :dir

  has_many :<%= class_name.underscore.pluralize %>
end
