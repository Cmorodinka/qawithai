class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :role
      t.string :test_case
      t.string :test_cycle

      t.timestamps
    end
  end
end
