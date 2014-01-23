Todos.Feed = DS.Model.extend(
  # an extended DS.Model also has a hidden 'id' attribute
  url: DS.attr("string")

  # you have you reference other types with humanised case and with no reference to the application namespace;
  # and you cannot have a hierarchy of model types; i.e. no Todos.Feed.Item; it has to be Todos.FeedItem
  # items: DS.hasMany("Todos.Feed.Item")
  items: DS.hasMany("feedItem",
    # You looked up the 'items' relationship on '<Todos.Feed:ember418:1>' but some of the associated records were not loaded. Either make sure they are all loaded together with the parent record, or specify that the relationship is async (`DS.hasMany({ async: true })`)
    # !!!!!!!! this is a horrible hack to satisfy a bug in the EmberJS fixture loader. see http://stackoverflow.com/questions/18705686/emberjs-record-with-hasmany-relation-fails-to-load
    async: true
  )

  refresh: ->
    alert 'Feed.refresh() called'
    # TODO implement refresh

)

# necessary to prevent 'Not implemented: You must override the DS.FixtureAdapter::queryFixtures method to support querying the fixture store.' fatal error
Todos.Feed.FIXTURES = [
  id: 1,      # an implicit ID parameter that needs to be set
  url: 'my test url',
  items: [1, 2, 3]   # need to explicitly define an array (empty or populated) or a fatal error will be thrown
]