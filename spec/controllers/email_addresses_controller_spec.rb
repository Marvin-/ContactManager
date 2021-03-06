require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe EmailAddressesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # EmailAddress. As you add validations to EmailAddress, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { address: 'email@email.com', contact_id: 1 }
  }

  let(:invalid_attributes) {
    { address: nil }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EmailAddressesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #new" do
    it "assigns a new email_address as @email_address" do
      get :new, params: {}, session: valid_session
      expect(assigns(:email_address)).to be_a_new(EmailAddress)
    end
  end

  describe "GET #edit" do
    it "assigns the requested email_address as @email_address" do
      email_address = EmailAddress.create! valid_attributes
      get :edit, params: {id: email_address.to_param}, session: valid_session
      expect(assigns(:email_address)).to eq(email_address)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:alice) { Person.create(first_name: 'Alice', last_name: 'Smith') }
      let(:valid_attributes) { { address: 'email1', contact_id: alice.id, contact_type: 'Person'} }

      it "creates a new EmailAddress" do
        expect {
          post :create, params: {email_address: valid_attributes}, session: valid_session
        }.to change(EmailAddress, :count).by(1)
      end

      it "assigns a newly created email_address as @email_address" do
        post :create, params: {email_address: valid_attributes}, session: valid_session
        expect(assigns(:email_address)).to be_a(EmailAddress)
        expect(assigns(:email_address)).to be_persisted
      end

      it "redirects to the created email_address" do
        post :create, params: {email_address: valid_attributes}, session: valid_session
        expect(response).to redirect_to(alice)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved email_address as @email_address" do
        post :create, params: {email_address: invalid_attributes}, session: valid_session
        expect(assigns(:email_address)).to be_a_new(EmailAddress)
      end

      it "re-renders the 'new' template" do
        post :create, params: {email_address: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:bob) { Person.create(first_name: 'Bob', last_name: 'Doe')}
      let(:valid_attributes) {{ address: 'email_old@yahoo.com', contact_id: bob.id, contact_type: 'Person'}}
      let(:new_attributes) {{ address: 'email@yahoo.com', contact_id: bob.id, contact_type: 'Person'}}

      it "updates the requested email_address" do
        email_address = EmailAddress.create! valid_attributes
        put :update, params: {id: email_address.to_param, email_address: new_attributes}, session: valid_session
        email_address.reload
        expect(email_address.address).to eq('email@yahoo.com')
      end

      it "assigns the requested email_address as @email_address" do
        email_address = EmailAddress.create! valid_attributes
        put :update, params: {id: email_address.to_param, email_address: valid_attributes}, session: valid_session
        expect(assigns(:email_address)).to eq(email_address)
      end

      it "redirects to the email_address person" do
        email_address = EmailAddress.create! valid_attributes
        put :update, params: {id: email_address.to_param, email_address: new_attributes}, session: valid_session
        expect(response).to redirect_to(bob)
      end
    end

    context "with invalid params" do
      it "assigns the email_address as @email_address" do
        email_address = EmailAddress.create! valid_attributes
        put :update, params: {id: email_address.to_param, email_address: invalid_attributes}, session: valid_session
        expect(assigns(:email_address)).to eq(email_address)
      end

      it "re-renders the 'edit' template" do
        email_address = EmailAddress.create! valid_attributes
        put :update, params: {id: email_address.to_param, email_address: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let(:bob) {Person.create(first_name: 'John', last_name: 'Doe')}
    let(:valid_attributes) {{address: 'hotmail.con', contact_id: bob.id}}
    it "destroys the requested email_address" do
      email_address = EmailAddress.create! valid_attributes
      expect {
        delete :destroy, params: {id: email_address.to_param}, session: valid_session
      }.to change(EmailAddress, :count).by(-1)
    end

    it "redirects to the email_addresses list" do
      email_address = EmailAddress.create! valid_attributes
      delete :destroy, params: {id: email_address.to_param}, session: valid_session
      expect(response).to redirect_to(bob)
    end
  end

end
