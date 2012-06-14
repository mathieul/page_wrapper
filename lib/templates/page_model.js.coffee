App.<%= class_name.camelize %>Page = DS.Model.extend PageWrapper.PageModelMixin,
  <%= class_name.underscore.pluralize %>: DS.hasMany('App.<%= class_name.camelize %>')
  itemsName: '<%= class_name.underscore.pluralize %>'
