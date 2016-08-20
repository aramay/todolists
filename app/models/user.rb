class User < ActiveRecord::Base
   has_one :profile
   has_many :todo_lists
   # has_many :todo_lists, through: :todo_lists_users
   # has_and_belongs_to_many :todo_lists
end
