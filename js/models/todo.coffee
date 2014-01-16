Todos.Todo = DS.Model.extend(
  title: DS.attr("string")
  isCompleted: DS.attr("boolean")
  created: DS.attr("date",
  	defaultValue: new Date()
  )
)
