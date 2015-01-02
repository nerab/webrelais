require 'json'

module Webrelais
  class Board
    def initialize(pin_count)
      @pins = pin_count.times.map do |i|
        Pin.new(i)
      end
  	end

    def pin(id)
      @pins[id]
    end

    def pin_count
      @pins.size
    end

    def pins
      @pins.dup
    end

    def to_json
      Hash[@pins.map{|p| [p.id, p.value]}].to_json
    end
  end
end
