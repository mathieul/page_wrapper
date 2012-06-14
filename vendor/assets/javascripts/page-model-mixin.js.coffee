window.PageWrapper ?= {}
PageWrapper.PageModelMixin = Ember.Mixin.create
  #
  # Fields
  #
  pages:     DS.attr('number')
  first:     DS.attr('boolean')
  last:      DS.attr('boolean')
  total:     DS.attr('number')
  per_page:  DS.attr('number')
  query:     DS.attr('string')
  sort:      DS.attr('string')
  dir:       DS.attr('string')

  #
  # Properties
  #
  paginated: (-> @get('pages') > 1).property('pages', 'isLoaded')

  from: (->
    1 + (@get('id') - 1) * @get('per_page')
  ).property('id', 'per_page', 'isLoaded')

  to: (->
    if @get('last')
      @get('total')
    else
      @get('from') + @get('per_page') - 1
  ).property('last', 'total', 'from', 'per_page', 'isLoaded')

  paginationItems: (->
    [current, query] = [@get('id'), @get('query')]
    items = @allItems(current, @get('pages'), query)
    items.unshift @firstItem(current, query, @get('first'))
    items.push @lastItem(current, query, @get('last'))
    items
  ).property('id', 'pages', 'total', 'query', 'isLoaded')

  #
  # Other methods
  #
  allItems: (current, pages, query) ->
    items = if pages < 9
      [1..pages]
    else
      switch current
        when 1, 2, 3, 4, 5
          [1, 2, 3, 4, 5, 6, '…', pages - 1, pages]
        when pages - 4, pages - 3, pages - 2, pages - 1, pages
          [1, 2, '…', pages - 5, pages - 4, pages - 3, pages - 2, pages - 1, pages]
        else
          [1, 2, '…', current - 1, current, current + 1, '…', pages - 1, pages]
    for i in items
      if i is '…'
        value: '…'
        disabled: true
      else
        page:    i
        query:   query
        value:   i
        active:  i is current

  firstItem: (current, query, first) ->
    page:      if first then 'disabled' else current - 1
    query:     query
    value:     '«'
    disabled:  first

  lastItem: (current, query, last) ->
    page:      if last then 'disabled' else current + 1
    query:     query
    value:     '»'
    disabled:  last
