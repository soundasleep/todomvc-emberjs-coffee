window.Todos = Ember.Application.create()

# create Fixture data for populating the application with some test data
Todos.ApplicationAdapter = DS.FixtureAdapter.extend()

Ember.Handlebars.helper('recentDate', (date) ->
	return moment(new Date(date)).fromNow()
)
