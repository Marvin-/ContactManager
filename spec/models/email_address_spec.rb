require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
  let(:person) { Person.create(:first_name => "Jimbob", :last_name => "Billy") }
  let(:email_address) {EmailAddress.new(address: 'email@email.com', contact_id: 1, contact_type: 'Person')}  

  it 'is valid' do 
    expect(email_address).to be_valid
  end

  it 'is invalid without an email_address' do 
    email_address.address = nil

    expect(email_address).not_to be_valid
  end

  it 'is invalid without a person_id' do 
    email_address.contact_id = nil

    expect(email_address).to_not be_valid
  end
end
