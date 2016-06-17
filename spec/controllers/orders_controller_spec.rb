require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe '#create' do
    it "should create the order" do
      order_params = {
          customer_id: 1,
          book_id: 2
      }
      post :create, order_params
      expected_order = (JSON.parse(response.body).with_indifferent_access)

      response.should be_success

      expect(response.code).to eql("201")
      expect(expected_order[:status]).to eql("confirmed")
      expect(expected_order[:book_id]).to eql(2)
      expect(expected_order[:customer_id]).to eql(1)
    end

    describe '#get' do
      it "should get the order of given id" do
        expect(Order).to receive(:where).with({id: "3"}).and_return("order")

        get :get, {id: 3}

        response.should be_success

        expect(response.code).to eql("200")
        expect(response.body).to eql("order")
      end
    end
  end
end
