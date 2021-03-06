require 'rails_helper'
require 'support/omniauth'

describe 'the company view', type: :feature do
  let(:company) { Fabricate(:company)}
  let(:user) { company.user}

  describe 'phone numbers' do
    before(:each) do
      company.phone_numbers.create(number: "555-1234")
      company.phone_numbers.create(number: "555-5678")
      login_as(user)
      visit company_path(company)
    end

    it 'show the phone numbers' do 
      company.phone_numbers.each do |phone|
        expect(page).to have_content(phone.number)
      end
    end

    it 'has a link to add a new phone number' do 
      expect(page).to have_link('Add phone number', href: new_phone_number_path(contact_id: company.id, contact_type: 'Company'))
    end

    it 'adds a new phone number' do 
      page.click_link('Add phone number')
      page.fill_in('Number', with: '555-8888')
      page.click_button('Save')
      expect(page.current_path).to eq(company_path(company))
      expect(page).to have_content('555-8888')
    end

    it 'has links to edit phone numbers' do 
      company.phone_numbers.each do |phone|
        expect(page).to have_link('edit', href: edit_phone_number_path(phone))
      end
    end

    it 'edits a phone number' do 
      phone = company.phone_numbers.first
      old_number = phone.number

      first(:link, 'edit').click
      page.fill_in('Number', with: '555-9191')
      page.click_button('Save')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('555-9191')
      expect(page).to_not have_content(old_number)
    end

    it 'has a link to delete phone numbers' do 
      company.phone_numbers.each do |phone|
        expect(page).to have_link('delete', href: phone_number_path(phone))
      end
    end
  end

  describe 'email addresses' do 
    before(:each) do
      company.email_addresses.create(address: "hotmail1")
      company.email_addresses.create(address: "hotmail2")
      login_as(user)
      visit company_path(company)
    end

    it 'show the email address' do 
      company.email_addresses.each do |email|
        expect(page).to have_content(email.address)
      end
    end

    it 'has link to add email address' do 
      expect(page).to have_link('Add email address', href: new_email_address_path(contact_id: company.id, contact_type: 'Company'))
    end

    it 'adds new email address' do 
      page.click_link('Add email address')
      page.fill_in('Address', with: 'email@hotmail.com')
      page.click_button('Save')
      expect(page.current_path).to eq(company_path(company))
      expect(page).to have_content('email@hotmail.com')
    end

    it 'has link to edit email address' do 
      company.email_addresses.each do |email|
        expect(page).to have_link('edit', href: edit_email_address_path(email))
      end
    end

    it 'edits email address' do 
      email = company.email_addresses.first
      old_email = email

      first(:link, 'edit').click
      page.fill_in('Address', with: 'new_email_address')
      page.click_button('Save')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('new_email_address')
    end

    it 'has a link to delete email address' do 
      company.email_addresses.each do |email|
        expect(page).to have_link('delete', href: email_address_path(email))
      end
    end
  end
end


