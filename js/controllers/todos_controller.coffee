# controller for View Todos

Todos.TodosController = Ember.ArrayController.extend(
  actions:
    createTodo: ->
      
      # Get the todo title set by the "New Todo" text field
      title = @get("newTitle")
      return unless title.trim()    # do we not return an error or something?
      
      # Create the new Todo model
      todo = @store.createRecord("todo",
        title: title
        isCompleted: false
        created: new Date().toString()     # extension: also define the created date
      )
      
      # Clear the "New Todo" text field
      @set "newTitle", ""
      
      # Save the new model
      todo.save()

    clearCompleted: ->
      completed = @filterBy('isCompleted', true)
      # note filterBy returns an EmberArray not a record, so we have to 'invoke' the methods we want on the result (ew)
      completed.invoke('deleteRecord')
      completed.invoke('save')

  # this is basically creating a runtime property/attribute that can be listened to?
  remaining: ( -> 
    @filterBy('isCompleted', false).get('length')   # implicit return
  ).property('@each.isCompleted')   # listening to the changes of another property? '@' special character?

  completed: ( -> 
    @filterBy('isCompleted', true).get('length')   # implicit return
  ).property('@each.isCompleted')   # listening to the changes of another property? '@' special character?

  hasCompleted: ( ->
    @get('completed') > 0
  ).property('completed')

  items: ( ->
    remaining = @get('remaining')
    # coffeescript can't handle ternary operators?
    # remaining == 1 ? 'item' : 'items'   # implicit return
    # 'is' and '==' are both changed to '===' (I guess we don't trust JS duck typing at all)
    (if remaining is 1 then "item" else "items")
  ).property('remaining')   # note it's not using a @

  # Jevon extension: add some special text for 0
  remainingText: ( ->
    (if @get('remaining') is 0 then "No" else @get('remaining'))
  ).property('remaining')
)
