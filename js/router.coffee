Todos.Router.map ->
	@resource 'todos',
		path: '/'

# create a route for displaying all todos
Todos.TodosRoute = Ember.Route.extend(model: ->
  @store.find "todo"
)