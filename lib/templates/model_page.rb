<%- names = class_name.underscore.pluralize -%>
class <%= class_name.camelize %>Page < PageWrapper::Model
  attr_reader :<%= names %>

  def fetch_records(page, options)
    # TODO: customize the logic below and consider moving it into
    #       a class method <%= class_name.camelize %>.paginated_query
    #       and simplify this method to a one-liner:
    #
    # @<%= names %> = <%= class_name.camelize %>.paginated_query(page, options)

    @<%= names %> = <%= class_name.camelize %>.page(page)
    @<%= names %> = @<%= names %>.per(options[:per_page]) if options[:per_page]
    @<%= names %>
  end
end
