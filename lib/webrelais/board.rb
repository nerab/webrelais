module Webrelais
  class Pin
    attr_reader :id

    def initialize(id)
      @id = id
    end

    def value
      %x[gpio read #{id}].chomp rescue -1
    end

    def value=(v)
      %x[gpio write #{id} #{v}] rescue -1
    end

    def to_s
      "Pin #{id}"
    end
  end

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
  end
end
