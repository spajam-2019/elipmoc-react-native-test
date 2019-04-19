Rails.application.routes.draw do
  scope :v1 do
    resources :github_repositories, only: [:index] do
      collection do
        get 'find_repositories'
      end
    end
  end
end