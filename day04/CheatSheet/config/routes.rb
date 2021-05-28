Rails.application.routes.draw do
  get 'cheat_sheet/index'
  root 'cheat_sheet#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
