require 'rails_helper'

describe 'Github Api Client' do

  it 'get_github_api_help' do
    client = GithubApiClient.new
    body = client.get_github_api_help
    expect(body["current_user_url"]).to eq "https://api.github.com/user"
  end
end