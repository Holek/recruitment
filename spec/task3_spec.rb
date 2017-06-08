require_relative 'spec_helper'

RSpec.describe 'Version compliance' do
  let(:incoming_webhook_v1) do
    {
      webhooks: [
        {type: 'liked', user: 'Xavier', post: 'plankton'},
        {type: 'liked', user: 'Victor', post: 'bamboo'},
        {type: 'liked', user: 'Trevor', post: 'bamboo'},
      ]
    }
  end
 
  let(:incoming_webhook_v2) do
    {
      webhooks: [
        {type: 'published', user: 'Benny',  video: 'bears'},
        {type: 'liked',     user: 'Hannah', video: 'bears'},
        {type: 'liked',     user: 'Graham', video: 'birds'},
        {type: 'unliked',   user: 'Agnes',  video: 'sheep'},
        {type: 'liked',     user: 'Agnes',  video: 'fish'},
      ]
    }
  end

  it 'works with both versions of payload' do
    post_json '/webhook', incoming_webhook_v1
    expect(last_response).to be_ok

    post_json '/webhook', incoming_webhook_v2
    expect(last_response).to be_ok

    get '/likes'
    expect(last_json).to eq(
      likes: {
        videos: {
          'cows' => 1,
          'bears' => 1,
          'birds' => 2,
          'fish' => 4,
          'pandas' => 4,
        }
      }
    )
  end
end
