# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/lotteries', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Lottery. As you add validations to Lottery, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Lottery.create! valid_attributes
      get lotteries_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      lottery = Lottery.create! valid_attributes
      get lottery_url(lottery)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_lottery_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      lottery = Lottery.create! valid_attributes
      get edit_lottery_url(lottery)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Lottery' do
        expect do
          post lotteries_url, params: { lottery: valid_attributes }
        end.to change(Lottery, :count).by(1)
      end

      it 'redirects to the created lottery' do
        post lotteries_url, params: { lottery: valid_attributes }
        expect(response).to redirect_to(lottery_url(Lottery.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Lottery' do
        expect do
          post lotteries_url, params: { lottery: invalid_attributes }
        end.to change(Lottery, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post lotteries_url, params: { lottery: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested lottery' do
        lottery = Lottery.create! valid_attributes
        patch lottery_url(lottery), params: { lottery: new_attributes }
        lottery.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the lottery' do
        lottery = Lottery.create! valid_attributes
        patch lottery_url(lottery), params: { lottery: new_attributes }
        lottery.reload
        expect(response).to redirect_to(lottery_url(lottery))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        lottery = Lottery.create! valid_attributes
        patch lottery_url(lottery), params: { lottery: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested lottery' do
      lottery = Lottery.create! valid_attributes
      expect do
        delete lottery_url(lottery)
      end.to change(Lottery, :count).by(-1)
    end

    it 'redirects to the lotteries list' do
      lottery = Lottery.create! valid_attributes
      delete lottery_url(lottery)
      expect(response).to redirect_to(lotteries_url)
    end
  end
end
