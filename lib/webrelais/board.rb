require 'json'

module Webrelais
  def self.gpio=(program)
    @gpio = program
  end

  def self.gpio
    @gpio ||= 'gpio'
  end

  class Pin
    attr_reader :id

    def initialize(id)
      @id = id
    end

    def value
      %x[#{Webrelais.gpio} read #{id}].chomp.to_i rescue -1
    end

    def value=(v)
      %x[#{Webrelais.gpio} write #{id} #{v}] rescue -1
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

    def pins
      @pins.dup
    end

    def to_json
      Hash[@pins.map{|p| [p.id, p.value]}].to_json
    end
  end
end
