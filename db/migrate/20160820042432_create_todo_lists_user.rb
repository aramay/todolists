class CreateTodoListsUser < ActiveRecord::Migration
  def change
    create_table :todo_lists_users, id: false do |t|
      t.references :user, index: true, foreign_key: true
      t.references :todo_list, index: true, foreign_key: true
    end
  end
end
