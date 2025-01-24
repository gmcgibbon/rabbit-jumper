# frozen_string_literal: true

class Game
  class Entity
    include Collision

    attr_reader :x, :y, :sprite

    def initialize(x:, y:, size:, path:, camera:)
      @x = x * Screen::SCALE
      @y = y * Screen::SCALE
      @w = size * Screen::SCALE
      @h = size * Screen::SCALE
      @camera = camera
      @sprite = Sprite.new(x: @x, y: @y, size: @w, path: path)
    end

    def tick(args)
      @sprite.x = @x - @camera.x
      @sprite.y = @y - @camera.y

      args.sprites << @sprite
    end
  end
end
