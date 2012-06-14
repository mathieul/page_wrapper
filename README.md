## Page Wrapper ##

Page Wrapper helps you add pagination to a list of resources fetched
from a Rails server and rendered using Ember and Ember Data.

It contains:

* a page model class intended to be extended to wrap a list of resources
  into a page
* a set of Ember classes to help fetching, browsing, sorting and
  filtering the list of resources within an Ember application
* a generator for all the Ruby and CoffeeScript files you need to paginate
  those resources

It requires a 3.1+ rails or rails-api application and a model to
paginate. There are no constraint on which ORM or plain old Ruby object
to use, or which tool to paginate or filter on the Ruby side. It is up
to you to code or integrate that part (i.e.: Active Record + Kaminari,
Mongoid + Kaminari, Remotely + Kaminari, etc...).

Finaly it is delegating most of the work to a set of great Ruby gems and
JavaScript libraries:

* [Rails API](https://github.com/spastorino/rails-api) or [Rails](http://rubyonrails.org/) for the web server
* [Active Model Serializers](https://github.com/josevalim/active_model_serializers/) to serialize the page instance and its collection
* [Ember Rails](https://github.com/emberjs/ember-rails) that comes with
  [Ember](http://emberjs.com/) and [Ember Data](https://github.com/emberjs/data) for fetching the data from the browser and rendering the collections and browse it page by page

## Getting Started ##

Page Wrapper works with Rails 3.1 onwards and Ember Rails 0.6.0+.

Add this line to your application's Gemfile:

```ruby
gem 'page_wrapper'
```

And then execute:

```console
$ bundle
```

After you install Page Wrapper and add it to your Gemfile, you need to
run the generator. Assuming you want to paginate *Movie* resources:

```console
rails generate page_wrapper:page movie
```

This command will generate the Ruby and Ember classes required to
paginate a **Movie** model and add a route to the index action of the
new server movie page controller.

At that point you just need to update your Ember application routing
manager to route to the new front-end movie page controller. Here is an
example of a single page with an outlet setup to contain the list of
movies:

```coffeescript
# app/assets/javascripts/routes/app_router.js.coffee

App.Router = Ember.Router.extend
  location: 'hash'

  root: Ember.State.extend
    index: Ember.State.extend
      route: '/'
      connectOutlets: (router) ->
        controller = router.get('applicationController')
        controller.connectOutlet(App.MoviePageView, App.MoviePageController::firstPage())
        moviePageController = router.get('moviePageController')
        moviePageController.set('target', moviePageController)
```
After reloading your application you should now look at the first page
and be able to interact with the pagination control to navigate
the collection page by page.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
