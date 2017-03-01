require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new}

  it 'is valid' do 
    expect(user).to be_valid
  end
end
