class AddContributorsToWiki < ActiveRecord::Migration
  def change
    add_column :wikis, :contributors, :array
  end
end
