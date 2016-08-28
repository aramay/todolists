class TodoList < ActiveRecord::Base
   belongs_to :user
   # has_and_belongs_to_many :users
   has_many :todo_items, dependent: :destroy
   default_scope {order :list_name}

end
