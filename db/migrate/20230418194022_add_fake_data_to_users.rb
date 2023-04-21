class AddFakeDataToUsers < ActiveRecord::Migration[6.1]
  def change
    User.create(name: 'John Doe', email: 'john.doe@example.com', role: 'Test Lead')
    User.create(name: 'Jane Doe', email: 'jane.doe@example.com', role: 'QA Automation')
    User.create(name: 'Bob Smith', email: 'bob.smith@example.com', role: 'QA Manual')
    User.create(name: 'Alice Jones', email: 'alice.jones@example.com', role: 'QA Manual')
  
  #   5.times do
  #     TestCase.create(name: Faker::Lorem.sentence(word_count: 3), page: 'login', rows: rand(5))
  #   end
  
  #   User.all.each do |user|
  #     3.times do
  #       TestCycle.create(user: user, cases: rand(20), completed: rand(10))
  #     end
  #   end
   end
  
end
