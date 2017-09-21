require 'rails_helper'

RSpec.describe User, type: :model do

  # validation of  fields presence
  it{ should validate_presence_of(:first_name) }
  it{ should validate_presence_of(:last_name) }
  it{ should validate_presence_of(:email) }
  it{ should validate_presence_of(:password) }

  # validation of fields of lengths
  it {should validate_length_of(:first_name).
    is_at_least(6).is_at_most(26)}
  it {should validate_length_of(:last_name).
    is_at_least(6).is_at_most(26)}
  it {should validate_length_of(:email).
    is_at_least(10).is_at_most(100)}
  it {should validate_length_of(:password).
    is_at_least(6).is_at_most(50)}


end
