# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "john", password_digest: "123")

TodoList.create(list_name: "grocery", list_due_date: DateTime.strptime("09/01/2017", "%m/%d/%Y"))

TodoList.create(list_name: "laundry", list_due_date: DateTime.strptime("09/01/2016", "%m/%d/%Y"))


john = User.first

todo = TodoList.first

john.todo_lists << todo
