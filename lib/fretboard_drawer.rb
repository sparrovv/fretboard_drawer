require_relative "fretboard_drawer/version"
require_relative "fretboard_drawer/fretboard"
require_relative "fretboard_drawer/fretboard_string"

module FretboardDrawer
  STRINGS = ["e", "b", "g", "d", "a", "e"]

  def self.draw(sounds={})
    result = fretboard.result(sounds)
    if Config.use_stdout
      puts result
    else
      result
    end
  end

  # reload @@fretboard if config was changed
  def self.reload
    @fretboard = nil
  end

  # this should be private
  def self.fretboard
    @fretboard ||=
      FretboardDrawer::Fretboard.new(
        Config.number_of_strings,
        Config.number_of_frets
    )
  end

  module Config
    extend self

    def number_of_strings
      @number_of_strings || 6
    end

    def number_of_strings=(strings)
      @number_of_strings = strings
    end

    def number_of_frets
      @number_of_frets || 20
    end

    def number_of_frets=(frets)
      @number_of_frets = frets
    end

    # if not set then true
    def use_stdout
      return true if @use_stdout.nil?

      @use_stdout
    end

    # true / false
    def use_stdout=(flag)
      @use_stdout = flag
    end
  end
end
