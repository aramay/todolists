class User < ActiveRecord::Base

   has_secure_password

   has_many :todo_lists, dependent: :destroy

   has_many :todo_items, through: :todo_lists, source: :todo_items


end
