# This is for NewCheatSheet app's controller. you can make methods in this.
class NewCheatSheetController < ApplicationController
  def convention
    @title = "Convention"
  end
  def console
    @title = "Console"
  end
  def ruby
    @title = "Ruby"
  end
  def ruby_concepts
    @title = "RubyConcepts"
  end
  def ruby_numbers
    @title = "RubyNumbers"
  end
  def ruby_arrays
    @title = "RubyArrays"
  end
  def ruby_hashes
    @title = "RubyHashes"
  end
  def ruby_strings
    @title = "RubyStrings"
  end
  def help
    @title = "Help"
  end
  def rails_commands
    @title = "RailsCommands"
  end
  def rails_editor
    @title = "RailsEditor"
  end
  def rails_erb
    @title = "RailsErb"
  end
  def rails_folder_structure
    @title = "RailsFolderStructure"
  end
  def rails
    @title = "Rails"
  end
  def quick_search
    @title = "QuickSearch"
  end
end
