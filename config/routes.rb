class SubdomainConstriant
  def self.matches?(request)
    restricted_subdomains = %w{ www admin }
    request.subdomain.present? && !restricted_subdomains.include?(request.subdomain)
  end
end

class SubdomainBlank
  def self.matches?(request)
    request.subdomain.blank?
  end
end


Rails.application.routes.draw do

  # resources :posts
  constraints SubdomainBlank do
    devise_for :users
    resources :accounts
    resources :roles
    root 'pages#home'
    get 'pages/about'
  end

  constraints SubdomainConstriant do
    root 'posts#index', as: :subdomain_root
    resources :posts
  end



end
