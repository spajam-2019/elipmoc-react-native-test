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

  private

  def convert_response res
    if res.status != 200
      pp ({error: res.headers})
    end
    JSON.parse res.body
  end
end