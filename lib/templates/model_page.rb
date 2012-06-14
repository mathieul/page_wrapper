class <%= class_name.camelize %>Page < PageWrapper::Model
  attr_reader :<%= class_name.underscore.pluralize %>

  def fetch_records(page, options)
    # TODO: customize the logic below and consider moving it into
    #       a class method <%= class_name.camelize %>.paginated_query
    #       and simplify this method to a one-liner:
    #
    # @<%= class_name.underscore.pluralize %> = <%= class_name.camelize %>.paginated_query(page, options)

    result = <%= class_name.camelize %>.page(page)
    result = result.per(options[:per_page]) if options[:per_page]
    result
  end
end
