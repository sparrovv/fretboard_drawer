module FretboardDrawer
  class Fretboard
    attr_reader :strings, :frets

    def initialize(strings, frets)
      @strings = strings
      @frets = frets
    end

    def result(sounds = {})
      result = ""
      result << frets_description << "\n"
      result << build_strings(sounds)

      result
    end

    def strings_structure(strings_sounds)
      result = []
      (1..@strings).each do |string_number|
        sounds = strings_sounds[string_number] || {}
        result << generate_string_structure(string_number, sounds)
      end
      result
    end

    private

    def build_strings(sounds)
      structure = strings_structure(sounds)
      structure.inject("") do |r, string|
        r << string.join() << "\n"
        r
      end
    end

    def frets_description
      frets_desc_numbers = [3, 5, 7, 9, 12, 14]
      result = ["  "]

      @frets.times do |f|
        if frets_desc_numbers.include?(f + 1)
          result << "  #{f+1}   "
        else
          result << " " * 6
        end
      end
      result.join()
    end

    def generate_string_structure(string_number, sounds_on_string)
      sound = STRINGS[string_number - 1]
      string = FretboardString.new(sound, @frets, sounds_on_string)
      string.structure
    end
  end

end
