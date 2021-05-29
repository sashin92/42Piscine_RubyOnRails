Rails.application.routes.draw do
  
  root 'cheat_sheet#convension'
  get 'convension' => 'cheat_sheet#convension'
  get 'ruby' => 'cheat_sheet#ruby'
  get 'ruby_concepts' => 'cheat_sheet#ruby_concepts'
  get 'ruby_numbers' => 'cheat_sheet#ruby_numbers'
  get 'ruby_strings' => 'cheat_sheet#ruby_strings'
  get 'ruby_arrays' => 'cheat_sheet#ruby_arrays'
  get 'ruby_hashes' => 'cheat_sheet#ruby_hashes'
  get 'rails' => 'cheat_sheet#rails'
  get 'rails_folder_structure' => 'cheat_sheet#rails_folder_structure'
  get 'rails_commands' => 'cheat_sheet#rails_commands'
  get 'rails_erb' => 'cheat_sheet#rails_erb'
  get 'rails_editor' => 'cheat_sheet#rails_editor'
  get 'help' => 'cheat_sheet#help'
  get 'console' => 'cheat_sheet#console'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
