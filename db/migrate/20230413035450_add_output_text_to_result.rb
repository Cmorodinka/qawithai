class AddOutputTextToResult < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :output_text, :string
  end
end
