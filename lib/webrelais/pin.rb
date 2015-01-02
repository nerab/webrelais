module Webrelais
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
end
