Rails.application.routes.draw do
  get 'cheat_sheet/cheat_sheet'
  root 'cheat_sheet#cheat_sheet'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
