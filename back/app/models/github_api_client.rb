require 'httpclient'

BASE_URL = "https://api.github.com/"

class GithubApiClient

  def initialize
    @http_client = HTTPClient.new
    @http_client.base_url = BASE_URL
    @http_client.default_header = {Authorization: "token #{ENV["GITHUB_API_TOKEN"]}"}

  end

  # github_api
  def get_github_api_help
    convert_response @http_client.get("/")
  end

  #リポジトリ検索
  # @return {now_page,page_count,repos:{lang,id,name,star,desc}}
  def find_repositories(keyword, page = 1)
    body = convert_response @http_client.get("/search/repositories", query: {
        q: "#{keyword} in:name", sort: "stars", order: "desc", page: page
    })
    {
        "repos" => body["items"].map do |x|
          {
              "lang" => x["language"] || "",
              "id" => x["id"],
              "name" => x["full_name"],
              "star" => x["stargazers_count"],
              "desc" => x["description"] || ""
          }
        end,
        "now_page" => page,
        "page_count" => body["total_count"]
    }
  end

  private

  def convert_response res
    if res.status != 200
      pp ({error: res.headers})
    end
    JSON.parse res.body
  end
end