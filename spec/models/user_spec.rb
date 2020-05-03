require 'rails_helper'

# Test suite for User model
RSpec.describe User, type: :model do
  # Association test
  it { should have_many(:todos) }
  
  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end