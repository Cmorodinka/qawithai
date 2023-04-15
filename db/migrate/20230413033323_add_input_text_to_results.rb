class AddInputTextToResults < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :input_text, :text
  end
end
