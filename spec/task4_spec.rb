require_relative 'spec_helper'

RSpec.describe 'Unlikes report' do
  it 'shows how many times a video was unliked' do
    get '/unlikes'
    expect(last_json).to eq(
      unlikes: {
        videos: {
          'cows' => 1,
          'pandas' => 1,
          'sheep' => 1,
        }
      }
    )
  end
end
