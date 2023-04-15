class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.text :prompt
      t.text :generated_text

      t.timestamps
    end
  end
end
