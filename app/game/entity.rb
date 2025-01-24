# frozen_string_literal: true

class Game
  class Entity
    attr_reader :x, :y, :sprite

    def initialize(x:, y:, size:, path:)
      x = x * Screen::SCALE
      y = y * Screen::SCALE
      size = size * Screen::SCALE
      @sprite = Sprite.new(x: x, y: y, size: size, path: path)
    end

    def tick(args)
      args.outputs.sprites << @sprite
    end
  end
end
