# controller for View Todos

Todos.TodosController = Ember.ArrayController.extend(actions:
  createTodo: ->
    
    # Get the todo title set by the "New Todo" text field
    title = @get("newTitle")
    return unless title.trim()    # do we not return an error or something?
    
    # Create the new Todo model
    todo = @store.createRecord("todo",
      title: title
      isCompleted: false
      created: new Date()     # extension: also define the created date
    )
    
    # Clear the "New Todo" text field
    @set "newTitle", ""
    
    # Save the new model
    todo.save()
)
