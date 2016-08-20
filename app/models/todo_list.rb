class TodoList < ActiveRecord::Base
   belongs_to :user
   has_many :todo_items, dependent: :destroy
   # has_and_belongs_to_many :users
end
