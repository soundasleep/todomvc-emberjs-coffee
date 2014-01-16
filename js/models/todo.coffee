Todos.Todo = DS.Model.extend(
  title: DS.attr("string")
  isCompleted: DS.attr("boolean")
  created: DS.attr("date",
  	defaultValue: new Date()
  )
)

Todos.Todo.FIXTURES = [
  id: 1
  title: "Start new job"
  isCompleted: true
  created: new Date(2014,1-1,14)
,
  id: 2
  title: "Start learning ember.js"
  isCompleted: false
  created: new Date(2014,1-1,16)
,
  id: 3
  title: "Profit!"
  isCompleted: false
]