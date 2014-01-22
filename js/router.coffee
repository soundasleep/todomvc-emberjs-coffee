Todos.Router.map ->
	@resource 'todos',
		path: '/',
		->			# yes, we require an empty function here so that child routes will work at all: see https://github.com/emberjs/website/pull/1252

# create a route for displaying all todos
Todos.TodosRoute = Ember.Route.extend(
	model: ->
  	@store.find "todo"
)

Todos.TodosIndexRoute = Ember.Route.extend(
	model: ->
		# return the same model as for the route 'todos' (i.e. return the same model as used in Todos.TodosRoute)
		@modelFor 'todos'		# implicit return; also the same as @modelFor('todos')
)
