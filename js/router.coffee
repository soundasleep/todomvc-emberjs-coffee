Todos.Router.map ->
	@resource 'todos',
		path: '/',
		->			# yes, we require an empty function here so that child routes will work at all: see https://github.com/emberjs/website/pull/1252
			@route 'active'
			@route 'completed'
			# also a route todos.index which is always present

# create a route for displaying all todos
Todos.TodosRoute = Ember.Route.extend(
	# I'm not sure this actually does anything
	model: ->
		# we still load all todos on the home page because these are used to display e.g. number of remaining items, 'clear completed' count etc
		# which do not change as we switch between route points
		@store.find "todo"

  # so we can get access to Feed too
  # Ember is designed to have a single model item for a single route? so we have to extend it this way? seems a bit weird
  # setupController: (controller, model) ->
  # 	controller.set('model', model)
  # 	controller.set('feed', @store.find('feed'))

  # we CANNOT render into an outlet here: causes 'TypeError: parentView is undefined'.
  # it looks like the problem is that this is a "routeless" view. Or something.
  # Also see: http://stackoverflow.com/questions/16922009/ember-js-named-outlets-error (which isn't particularly insightful either)
  # renderTemplate: (controller) ->
  # # 	debugger
  # # 	@render 'todos/feeds',
  # # 		into: 'feeds',		# the route to render to
  # # 		outlet: 'feeds',	# the name of the outlet in the route's template
  # # 		controller: 'feed'
  # # renderTemplate: (controller) ->
  # 	@render 'todos/index',
  # 		# into: 'todos' - causes 'TypeError: parentView is undefined'
  # 		outlet: 'todos',
  # 		into: 'todos',		# required - otherwise 'An outlet (todos) was specified but was not found.' error is displayed
  # 		controller: controller
  # 	# @render 'todos/feeds',
  # 	# 	into: 'todos',
  # 	# 	outlet: 'feeds'
  # 	# @render
  # 	# 	into: 'todos',
  	# 	outlet: 'feeds'
)

Todos.TodosIndexRoute = Ember.Route.extend(
	model: ->
		# return the same model as for the route 'todos' (i.e. return the same model as used in Todos.TodosRoute)
		# @modelFor 'todos'		# implicit return; also the same as @modelFor('todos')
		todos: @store.find 'todo'					# no , here! silly coffeescript
		feeds: @store.find 'feed'

	# TODO test: can we create a renderTemplate as below, i.e. we get an implicit renderTemplate based on the naming convention of this route?
	renderTemplate: (controller) ->
		@render 'todos/index',
			# into the default outlet
			controller: controller

		@render 'todos/feeds',
			outlet: 'feeds',				# 'into' is already 'todos' and not necessary here
			controller: controller
)

Todos.TodosActiveRoute = Ember.Route.extend(
	model: ->
		todos: @store.filter 'todo', (todo) ->			# implicit return
			!todo.get 'isCompleted'					# implicit return
		feeds: @store.find 'feed'					# TODO this code is being duplicated everywhere. any way to simplify it?

	renderTemplate: (controller) ->
		@render 'todos/index', 
			controller: controller

		@render 'todos/feeds',
			outlet: 'feeds',				# 'into' is already 'todos' and not necessary here
			controller: controller
)

Todos.TodosCompletedRoute = Ember.Route.extend(
	model: ->
		todos: @store.filter 'todo', (todo) ->			# implicit return
			todo.get 'isCompleted'					# implicit return
		feeds: @store.find 'feed'

	renderTemplate: (controller) ->
		@render 'todos/index', 
			controller: controller

		@render 'todos/feeds',
			outlet: 'feeds',				# 'into' is already 'todos' and not necessary here
			controller: controller
)
