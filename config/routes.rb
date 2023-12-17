Rails.application.routes.draw do
  resources :urls, only: [:create] do
    collection do
      get ':short_url' => 'urls#show'
      get ':short_url/stats' => 'urls#stats'
    end
  end
end
