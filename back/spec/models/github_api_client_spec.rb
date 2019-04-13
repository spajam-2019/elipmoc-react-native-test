require 'rails_helper'

describe 'Github Api Client' do
  client = GithubApiClient.new

  it 'get_github_api_help' do
    body = client.get_github_api_help
    expect(body["current_user_url"]).to eq "https://api.github.com/user"
  end

  it "リポジトリ検索" do
    body = client.find_repositories "a" ,2
    expect(body["repos"]).to_not eq nil
    expect(body["now_page"]).to eq 2
    expect(body["page_count"]).to_not eq nil
    body["repos"].each {|r|
      expect(r["id"]).to_not eq nil
      expect(r["name"]).to_not eq nil
      expect(r["lang"]).to_not eq nil
      expect(r["star"]).to_not eq nil
      expect(r["desc"]).to_not eq nil
    }

  end
end