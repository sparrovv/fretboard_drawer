module FretboardDrawer
  class FretboardString
    def initialize(sound, frets, sounds_on_frets={})
      @sound = sound
      @frets = frets
      @sounds_on_frets = sounds_on_frets
    end

    def structure
      head = "#{@sound}"
      result = [head, "|"]

      (1..@frets).each do |f|
        if draw_on_fret?(f)
          symbol = fret_symbol(f)
          result << fret_symbol_part(symbol)
        else
          result << "-" * 5
        end
        result << "|"
      end

      result
    end

    private

    def fret_symbol_part(symbol)
      if symbol.size == 1
        "--#{symbol}--"
      else
        "-#{symbol}--"
      end
    end
    def fret_symbol(fret)
      @sounds_on_frets[fret]
    end

    def draw_on_fret?(fret)
      @sounds_on_frets.keys.include?(fret)
    end
  end
end
