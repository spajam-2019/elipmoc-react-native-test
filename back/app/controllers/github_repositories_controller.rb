class GithubRepositoriesController < ApplicationController

  # エラーレスポンスを返す
  def error_render(err_msg)
    render json: {msg: err_msg.to_s}, status: :unprocessable_entity
  end

  #keywordに基づいてGithubのリポジトリを検索して結果を返す
  def find_repositories
    return error_render "you need keyword" if params["keyword"].nil?
    page = params["page"] || 1
    render json: GithubApiClient.new.find_repositories(params["keyword"], page.to_i)
  end
end
