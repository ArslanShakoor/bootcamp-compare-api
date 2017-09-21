require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Camp, type: :model do
# validation the presence of fields values
it{should validate_presence_of(:name)}
it{should validate_presence_of(:fees)}
it{should validate_presence_of(:website)}
it{should validate_presence_of(:course)}
it{should validate_presence_of(:user_id)}

# validation the length of feilds values
it {should validate_length_of(:name).
  is_at_least(6).is_at_most(40)}
it {should validate_length_of(:website).
  is_at_least(10).is_at_most(100)}
it {should validate_length_of(:course).
  is_at_least(10).is_at_most(100)}
it {should validate_length_of(:facebook).
  is_at_least(10).is_at_most(100)}
it {should validate_length_of(:twitter).
  is_at_least(10).is_at_most(100)}

# validation the ranges
it { should validate_inclusion_of(:graduation_rate).in_range(0..100) }
it { should validate_inclusion_of(:employment_rate).in_range(0..100) }
it { should validate_inclusion_of(:averge_salary).in_range(0..1000000) }
it { should validate_inclusion_of(:fees).in_range(0..50000) }


end
