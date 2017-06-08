require_relative 'spec_helper'

RSpec.describe 'Like report' do
  it 'shows how many likes each post has' do
    get '/likes'

    expect(last_json).to eq(
      likes: {
        posts: {
          'bamboo' => 3,
          'grass' => 2,
          'plankton' => 2,
          'corn' => 1,
          'seed' => 1,
        }
      }
    )
  end
end
