window.PageWrapper ?= {}
PageWrapper.PaginatedControllerMixin = Ember.Mixin.create
  #
  # Properties
  #
  currentPage: (->
    array = @get('content')
    array && array.objectAt(0)
  ).property('content.isLoaded')

  #
  # Event handlers
  #
  changePage: (event) ->
    page = $(event.target).data('page')
    @update(id: page) unless page is 'disabled'

  filter: (event) ->
    query = $(event.target).prev().val()
    query = $.trim(query)
    id = 1
    @update(id: id, query: query)

  changeSort: (event) ->
    sortType = $(event.target).data('sort')
    page = @get('content').objectAt(0)
    [sort, dir] = if page.get('sort') is sortType
      [sortType, if page.get('dir') is 'asc' then 'desc' else 'asc']
    else
      [sortType, 'asc']
    @update(sort: sort, dir: dir)

  #
  # Other methods
  #
  firstPage: ->
    @model.find(id: 1)

  sortIndicator: (column) ->
    page = @get('content').objectAt(0)
    return '' unless page? and column is page.get('sort')
    if page.get('dir') is 'asc' then '▼' else '▲'

  update: (params = {}) ->
    page = @get('content').objectAt(0)
    params.id ?= page.get('id')
    params.query ?= page.get('query')
    params.sort ?= page.get('sort')
    params.dir ?= page.get('dir')
    for name, value of params
      delete params[name] unless value?
    @set('content', @get('model').find(params))
