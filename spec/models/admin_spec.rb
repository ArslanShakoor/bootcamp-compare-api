require 'rails_helper'

RSpec.describe Admin, type: :model do

  # valiadation of assocation
  it { should have_many(:camps).dependent(:destroy)}
end
