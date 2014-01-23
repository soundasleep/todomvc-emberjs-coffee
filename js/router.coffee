Todos.Router.map ->
	@resource 'todos',
		path: '/',
		->			# yes, we require an empty function here so that child routes will work at all: see https://github.com/emberjs/website/pull/1252
			@route 'active'
			@route 'completed'
			# also a route todos.index which is always present
			@route 'feed'

# create a route for displaying all todos
Todos.TodosRoute = Ember.Route.extend(
	# I'm not sure this actually does anything
	model: ->
  	# @store.find "todo",
  	# this creates a "Not implemented: You must override the DS.FixtureAdapter::queryFixtures method to support querying the fixture store." on the feed @store.find call
  	# Ember.RSVP.hash(
  	# 	model: @store.find 'todo',
  	# 	# feed: @modelFor 'feed'
  	# 	feed: @store.find 'feed'
  	# )
		# Ember.Object.create(
		# 	model: @store.find 'todo'
		# 	feed: @store.find 'feed'
		# )
		# from http://stackoverflow.com/questions/19789239/ember-1-1-a-composite-view-of-several-routes-at-once
		#todos: @store.find 'todo'
		#feeds: @store.find 'feed'
		todos: @store.find 'todo'

  # so we can get access to Feed too
  # Ember is designed to have a single model item for a single route? so we have to extend it this way? seems a bit weird
#  setupController: (controller, model) ->
  	# controller.set('model', model)
  	# controller.set('feed', @modelFor('feed'))
  	# controller.get('feed').refresh()
#  	controller.setProperties(model)
  	# model.feed.refresh()
  	# we can't call refresh() in here because we don't have the feed model yet?
)

Todos.TodosIndexRoute = Ember.Route.extend(
	model: ->
		# return the same model as for the route 'todos' (i.e. return the same model as used in Todos.TodosRoute)
		@modelFor 'todos'		# implicit return; also the same as @modelFor('todos')

	# TODO test: can we create a renderTemplate as below, i.e. we get an implicit renderTemplate based on the naming convention of this route?
	renderTemplate: (controller) ->
		@render 'todos/index',
			controller: controller
)

Todos.TodosActiveRoute = Ember.Route.extend(
	model: ->
		@store.filter 'todo', (todo) ->			# implicit return
			!todo.get 'isCompleted'					# implicit return

	renderTemplate: (controller) ->
		@render 'todos/index', 
			controller: controller
)

Todos.TodosCompletedRoute = Ember.Route.extend(
	model: ->
		@store.filter 'todo', (todo) ->			# implicit return
			todo.get 'isCompleted'					# implicit return

	renderTemplate: (controller) ->
		@render 'todos/index', 
			controller: controller
)

Todos.TodosFeedRoute = Ember.Route.extend(
	model: ->
		@store.find 'feed'

	# setupController: (controller, feed) ->
	# 	feed.refresh()
)
