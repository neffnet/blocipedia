class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.references :user
      t.references :wiki

      t.timestamps null: false
    end
  end
end
