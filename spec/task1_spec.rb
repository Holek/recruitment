require_relative 'spec_helper'

RSpec.describe 'Data saving' do
  let(:incoming_webhooks_part_one) do
    {
      webhooks: [
        {type: 'posted',  user: 'Graham', post: 'seed', video: 'birds'},
        {type: 'posted',  user: 'Ian', post: 'corn', video: 'cows'},
        {type: 'posted',  user: 'Jennifer', post: 'grass', video: 'sheep'},
        {type: 'liked',   user: 'Hannah', post: 'corn'},
        {type: 'liked',   user: 'Graham', post: 'corn'},
        {type: 'unliked', user: 'Hannah', post: 'corn'},
        {type: 'liked',   user: 'Agnes', post: 'grass'},
        {type: 'liked',   user: 'Agnes', post: 'seed'},
      ]
    }
  end

  let(:incoming_webhooks_part_two) do
    {
      webhooks: [
        {type: 'posted',  user: 'Hannah', post: 'dogfood', video: 'dogs'},
        {type: 'posted',  user: 'Benny',  post: 'milk', video: 'cats'},
        {type: 'posted',  user: 'Walter', post: 'plankton', video: 'fish'},
        {type: 'posted',  user: 'Larry',  post: 'bamboo', video: 'pandas'},
      ]
    }
  end

  let(:incoming_webhooks_part_three) do
    {
      webhooks: [
        {type: 'liked', user: 'Cliona', post: 'plankton'},
        {type: 'liked', user: 'Hannah', post: 'bamboo'},
        {type: 'liked', user: 'Larry', post: 'bamboo'},
        {type: 'liked', user: 'Walter', post: 'grass'},
        {type: 'liked', user: 'Graham', post: 'plankton'},
        {type: 'liked', user: 'David', post: 'bamboo'},
        {type: 'liked', user: 'Etna', post: 'bamboo'},
        {type: 'unliked', user: 'David', post: 'bamboo'},
      ]
    }
  end

  it 'saves incoming webhooks' do
    post_json '/webhook', incoming_webhooks_part_one

    expect(last_response).to be_ok
    expect(last_json).to eq('saved' => 5)

    post_json '/webhook', incoming_webhooks_part_two

    expect(last_response).to be_ok
    expect(last_json).to eq('saved' => 4)

    post_json '/webhook', incoming_webhooks_part_three

    expect(last_response).to be_ok
    expect(last_json).to eq('saved' => 8)
  end
end
