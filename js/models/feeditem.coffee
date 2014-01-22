Todos.FeedItem = DS.Model.extend(
	id: DS.attr('string')
	title: DS.attr('string')
)

# necessary to prevent 'Not implemented: You must override the DS.FixtureAdapter::queryFixtures method to support querying the fixture store.' fatal error
Todos.FeedItem.FIXTURES = [
]
