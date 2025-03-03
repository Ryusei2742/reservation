FactoryBot.define do
  factory :reservation do
    check_in { "2025-01-19" }
    check_out { "2025-01-19" }
    guests { 1 }
    room { nil }
    user { nil }
  end
end
