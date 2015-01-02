module Webrelais
  class Pin
    attr_reader :id

    def initialize(id)
      @id = id
    end

    def value
      %x[#{Webrelais.gpio} read #{id}].chomp.to_i ^ 1
    rescue
      -1
    end

    def value=(v)
      %x[#{Webrelais.gpio} write #{id} #{v ^ 1}] rescue -1
    end

    def to_s
      "Pin #{id}"
    end
  end
end
