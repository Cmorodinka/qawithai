class CreateExecutions < ActiveRecord::Migration[6.1]
  def change
    create_table :executions do |t|
      t.string :input_text
      t.string :output_text

      t.timestamps
    end
  end
end
