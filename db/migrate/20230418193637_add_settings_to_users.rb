class AddSettingsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :test_case, :string
    add_column :users, :test_cycle, :string
  end
end
