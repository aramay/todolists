# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
TodoList.destroy_all
TodoItem.destroy_all
Profile.destroy_all

User.create(username: "Fiorina", password_digest: "123")
User.create(username: "Trump", password_digest: "123")
User.create(username: "Carson", password_digest: "123")
User.create(username: "Clinton", password_digest: "123")

fiorina = User.find_by(username: "Fiorina")
fiorina.create_profile(first_name: "Carly", last_name: "Fiorina", birth_year: "1954", gender: "female")

trump = User.find_by(username: "Trump")
trump.create_profile(first_name: "Donald", last_name: "Trump", birth_year: "1946", gender: "male")

carson = User.find_by(username: "Carson")
carson.create_profile(first_name: "Ben", last_name: "Carson", birth_year: "1951", gender: "male")

clinton = User.find_by(username: "Clinton")
clinton.create_profile(first_name: "Hillary", last_name: "Clinton", birth_year: "1947", gender: "female")

tdl1 = TodoList.create(list_name: "grocery", list_due_date: 1.year.from_now)
tdl2 = TodoList.create(list_name: "laundry", list_due_date: 1.year.from_now)
tdl3 = TodoList.create(list_name: "car service", list_due_date: 1.year.from_now)
tdl4 = TodoList.create(list_name: "window shopping", list_due_date: 1.year.from_now)



fiorina.todo_lists << tdl1
trump.todo_lists << tdl2
carson.todo_lists << tdl3
clinton.todo_lists << tdl4

completed = [true, false]

5.times do
   # tdl1 << TodoItem.create(title: Faker::Superhero.name, description: Faker::ChuckNorris.fact, completed: completed.sample)
   tdl1.todo_items.create(title: Faker::Superhero.name, description: Faker::ChuckNorris.fact, completed: completed.sample)
   tdl2.todo_items.create(title: Faker::Superhero.name, description: Faker::ChuckNorris.fact, completed: completed.sample)

   tdl3.todo_items.create(title: Faker::Superhero.name, description: Faker::ChuckNorris.fact, completed: completed.sample)

   tdl4.todo_items.create(title: Faker::Superhero.name, description:      Faker::ChuckNorris.fact, completed: completed.sample)
end

#
# john = User.first
#
# todo = TodoList.first
#
# john.todo_lists << todo
