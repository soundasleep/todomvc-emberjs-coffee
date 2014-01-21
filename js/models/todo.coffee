Todos.Todo = DS.Model.extend(
  title: DS.attr("string")
  isCompleted: DS.attr("boolean")
  # Ember DS doesn't seem to handle date well at all, so we will use string - which is a terrible workaround
  # Having an attribute as type "date" seems to reset the date string randomly when updating isCompleted,
  # I don't know how to debug this but this approach will have to do.
  created: DS.attr("string")
  # created: DS.attr("date")
  # specifying a defaultValue for date seems to create timing bugs in Firefox where changing isCompleted resets the created date.
  # ,
  # 	defaultValue: ->
  #     # wrapping this in a function doesn't seem to make any difference
  #     new Date()    # implicit return too
  # )
)

Todos.Todo.FIXTURES = [
  id: 1
  title: "Start new job"
  isCompleted: true
  created: new Date(2014,1-1,14).toString()
,
  id: 2
  title: "Start learning ember.js"
  isCompleted: false
  created: new Date(2014,1-1,16).toString()
,
  id: 3
  title: "Profit!"
  isCompleted: false
  created: new Date().toString()
]