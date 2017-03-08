require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company) { Fabricate(:company)}

  it 'is valid' do 
    expect(company).to be_valid
  end

  it 'is invalid without a name' do 
    company.name = nil

    expect(company).to_not be_valid
  end

  it "responds with its phone numbers after they're created" do 
    phone_number = company.phone_numbers.build(number: "333-4444")
    expect(phone_number.number).to eq('333-4444')
  end

  it "responds with its email addresses after they're created" do 
    email_address = company.email_addresses.build(address: "name@name.com")
    expect(email_address.address).to eq("name@name.com")
  end

  it 'convert to a string with last name, first name' do 
    expect(company.to_s).to eq "Sample company"
  end
end
