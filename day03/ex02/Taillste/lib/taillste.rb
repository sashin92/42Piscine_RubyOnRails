require 'taillste/version.rb'

module Taillste

  class Drum
    def initialize
      @arr = [1, 4, 9]
      @who_with = "Both arms and legs"
    end
    
    def beat
      return @arr
    end

    def shuffle
      return @arr.shuffle
    end

    def count
      str = ""
      9.times do |i|
        if @arr.include?(i + 1)
          str += "#{i + 1}\n"
        else
          str += ".\n"
        end
      end
      return str
    end
    def played_with
      return @who_with
    end
  end

  class Beat_box < Drum
    def initialize
      @arr = [1, 5, 7]
      @who_with = "Mouth"
    end
  end

  class Clap < Drum
    def initialize
      @arr = [2, 3, 7, 8]
      @who_with = "Both_hands"
    end
  end

end

a = Taillste::Drum.new