class AddIconAndBioToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :icon, :string
    add_column :users, :bio, :text
  end
end
