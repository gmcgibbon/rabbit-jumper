# frozen_string_literal: true

class Game
  class Output
    SERIALIZED_ATTRIBUTES = %i().freeze

    attr_reader :primitive_marker

    def initialize(primitive_marker)
      @primitive_marker = primitive_marker
    end

    def serialize
      SERIALIZED_ATTRIBUTES.to_h { |key| [key, instance_varialbe_get(:"@#{key}")] }
    end

    def to_s
      serialize.to_s
    end

    def inspect
      to_s
    end
  end
end
