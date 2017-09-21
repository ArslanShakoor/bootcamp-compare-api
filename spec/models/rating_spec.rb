require 'rails_helper'

RSpec.describe Rating, type: :model do
  #validation presence of fields values
  it{should validate_presence_of(:name)}
  it{should validate_presence_of(:email)}
  it{should validate_presence_of(:title)}
  it{should validate_presence_of(:description)}
  it{should validate_presence_of(:overall_review)}
  it{should validate_presence_of(:instructor_review)}
  it{should validate_presence_of(:job_assistance_review)}
  it{should validate_presence_of(:curriculum_review)}

  #validation the lengths of fields values
  it {should validate_length_of(:name).
    is_at_least(6).is_at_most(26)}
  it {should validate_length_of(:email).
    is_at_least(10).is_at_most(100)}
  it {should validate_length_of(:title).
    is_at_least(10).is_at_most(100)}
  it {should validate_length_of(:description).
    is_at_least(50).is_at_most(1500)}

  # validation the ranges of value
  it { should validate_inclusion_of(:overall_review).in_range(1..5) }
  it { should validate_inclusion_of(:instructor_review).in_range(1..5) }
  it { should validate_inclusion_of(:job_assistance_review).in_range(1..5) }
  it { should validate_inclusion_of(:curriculum_review).in_range(1..5) }

  
end
