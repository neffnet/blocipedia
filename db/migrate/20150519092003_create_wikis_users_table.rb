class CreateWikisUsersTable < ActiveRecord::Migration
  def change
    create_table :users_wikis, id: false do |t|
      t.integer :wiki_id
      t.integer :user_id
    end
  end
end
