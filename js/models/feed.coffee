Todos.Feed = DS.Model.extend(
  # an extended DS.Model also has a hidden 'id' attribute
  url: DS.attr("string")

  # you have you reference other types with humanised case and with no reference to the application namespace;
  # and you cannot have a hierarchy of model types; i.e. no Todos.Feed.Item; it has to be Todos.FeedItem
  # see: http://stackoverflow.com/questions/18588616/ember-data-not-finding-model-while-it-is-clearly-there
  # items: DS.hasMany("Todos.Feed.Item")
  items: DS.hasMany("feedItem")

  refresh: ->
    alert 'Feed.refresh() called'
    # TODO implement refresh

)

# necessary to prevent 'Not implemented: You must override the DS.FixtureAdapter::queryFixtures method to support querying the fixture store.' fatal error
Todos.Feed.FIXTURES = [
  id: 1,      # an implicit ID parameter that needs to be set
  url: 'my test url',
  items: []   # need to explicitly define an empty array or a fatal error will be thrown
]