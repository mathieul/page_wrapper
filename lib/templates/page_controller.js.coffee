App.<%= class_name.camelize %>PageController = Ember.ArrayController.extend PageWrapper.PaginatedControllerMixin,
  model: App.<%= class_name.camelize %>Page

  #
  # Properties
  #
  # TODO: create properties for the field titles to use in the view template
  #
  # i.e.: if title is a sortable field
  #
  # titleLabel: (->
  #   "Title #{@sortIndicator('title')}"
  # ).property('content.isLoaded')
  #
  # => {{titleLable}} renders a link with sort direction in the view template
