require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Camp, type: :model do

it{ should validate_presence_of(:name)}
it{ should validate_presence_of(:fees)}
it{ should validate_presence_of(:website)}
it{ should validate_presence_of(:course)}
end