class AddFailedToResults < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :failed, :boolean
  end
end
