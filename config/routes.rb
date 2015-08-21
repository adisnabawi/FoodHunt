Rails.application.routes.draw do
  resources :comments

  devise_for :users
  resources :recipes, :path => "restaurant" do
    member do
      put "like", to: "recipes#upvote"
    end
  end

 root "recipes#index"
end
