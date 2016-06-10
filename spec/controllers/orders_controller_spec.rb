require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  render_views

  describe '#create' do
    it "should create the order" do
      order_params = {
          customer_id: 1,
          status: "confirmed",
          book_id: 2
      }
      post :create, order_params
      response.should be_success
      expect(response.code).to eql("201")
    end


    it "should get the order of given id" do
      order = Order.new({customer_id: 7,book_id: 6, status: 'confirmed'})
      order.save!
      params = {id: order.id}
        get :get,params
      expected_order = (JSON.parse(response.body).with_indifferent_access)[:order]
      response.should be_success
      expect(response.code).to eql("200")

      expect(expected_order[:customer_id]).to eql(7)
      expect(expected_order[:book_id]).to eql(6)
      expect(expected_order[:status]).to eql('confirmed')
    end
  end
end
