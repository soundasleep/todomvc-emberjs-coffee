Todos.Router.map ->
	@resource 'todos',
		path: '/',
		->			# yes, we require an empty function here so that child routes will work at all: see https://github.com/emberjs/website/pull/1252
			@route 'active'
			@route 'completed'
			# also a route todos.index which is always present
			@route 'feeds'

# create a route for displaying all todos
Todos.TodosRoute = Ember.Route.extend(
	# I'm not sure this actually does anything
	model: ->
  	@store.find "todo",

  # so we can get access to Feed too
  # Ember is designed to have a single model item for a single route? so we have to extend it this way? seems a bit weird
  # setupController: (controller, model) ->
  # 	controller.set('model', model)
  # 	controller.set('feed', @store.find('feed'))

  # renderTemplate: ->
  # 	debugger
  # 	@render 'todos/feeds',
  # 		into: 'feeds',		# the route to render to
  # 		outlet: 'feeds',	# the name of the outlet in the route's template
  # 		controller: 'feed'
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

Todos.TodosFeedsRoute = Ember.Route.extend(
	model: ->
		@store.find 'feed'

	# renderTemplate: (controller) ->
	# 	@render 'todos/feeds',
	# 		controller: controller

	setupController: (controller, feed) ->
	# 	debugger
	# 	feed.refresh()
)
