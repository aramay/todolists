class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.string :list_name
      t.date :list_due_date

      t.timestamps null: false
      t.references :user, index: true, foreign_key: true

    end
  end
end
