# controller for model object Todo

# property being used as a setter
# note extra () needed around function; coffeescript doesn't handle function() {}.method very well (which is used a lot in Ember apparently)
Todos.TodoController = Ember.ObjectController.extend(
  actions:
    isCompleted: ((key, value) ->
      model = @get("model")
      # alternative syntax: if value is `undefined` (using backticks)
      if typeof value is 'undefined'
        # property being used as a getter
        model.get "isCompleted"     # implicit return
      else
        # property being used as a setter
        model.set "isCompleted", value
        model.save()
        value       # implicit return
    ).property("model.isCompleted")

    editTodo: ( ->
      @set('isEditing', true)
    )

    acceptChanges: ( -> 
      @set('isEditing', false)

      if Ember.isEmpty(@get('model.title'))
        @send('removeTodo')
      else
        @get('model').save()
    )

    removeTodo: ( ->
      todo = @get('model')
      todo.deleteRecord()
      todo.save()
    )

  isEditing: false
)
