class AddPassToResults < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :pass, :boolean
  end
end
