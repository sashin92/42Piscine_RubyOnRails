Rails.application.routes.draw do
  get '/' => 'new_cheat_sheet#convention'
  get 'console' => 'new_cheat_sheet#console'
  get 'ruby' => 'new_cheat_sheet#ruby'
  get 'ruby-concepts' => 'new_cheat_sheet#ruby_concepts'
  get 'ruby-numbers' => 'new_cheat_sheet#ruby_numbers'
  get 'ruby-strings' => 'new_cheat_sheet#ruby_strings'
  get 'ruby-arrays' => 'new_cheat_sheet#ruby_arrays'
  get 'ruby-hashes' => 'new_cheat_sheet#ruby_hashes'
  get 'rails' => 'new_cheat_sheet#rails'
  get 'rails-folder-structure' => 'new_cheat_sheet#rails_folder_structure'
  get 'rails-commands' => 'new_cheat_sheet#rails_commands'
  get 'rails-erb' => 'new_cheat_sheet#rails_erb'
  get 'rails-editor' => 'new_cheat_sheet#rails_editor'
  get 'help' => 'new_cheat_sheet#help'
  get 'quick_search' => 'new_cheat_sheet#quick_search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
