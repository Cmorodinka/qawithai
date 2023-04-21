FactoryBot.define do
  factory :result do
    input_text { "Sample input text" }
    output_text { "Sample output text" }
    created_at { Time.current }
  end
end

