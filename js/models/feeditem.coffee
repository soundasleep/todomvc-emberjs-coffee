Todos.FeedItem = DS.Model.extend(
	# id: DS.attr('string')		# not allowed
	feedId: DS.attr('string')
	title: DS.attr('string')
)

# necessary to prevent 'Not implemented: You must override the DS.FixtureAdapter::queryFixtures method to support querying the fixture store.' fatal error
Todos.FeedItem.FIXTURES = [
  id: 1,
  feedId: 'item1',
  title: 'Meow'
,
  id: 2,
  feedId: 'item2',
  title: 'Meow meow'
,
  id: 3,
  feedId: 'item3',
  title: 'Hooray'
]
