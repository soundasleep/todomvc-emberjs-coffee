Todos.EditTodoView = Ember.TextField.extend(
	didInsertElement: ->
		@$().focus()		# this.$().focus
)

Ember.Handlebars.helper('edit-todo', Todos.EditTodoView)
