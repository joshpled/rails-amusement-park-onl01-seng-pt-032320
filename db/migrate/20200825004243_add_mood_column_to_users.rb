class AddMoodColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :mood, :string, :default => nil
  end
end
