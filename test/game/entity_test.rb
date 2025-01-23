require "test/test_helper"

class Game
  class EntityTest < TestCase
    setup do
      @camera = Camera.new
      @entity = Entity.new(x: 2, y: 2, size: 4, camera: @camera, path: "sprites/coin.png")
    end

    test "multiplies coordinates by scale" do
      assert.equal!(2 * Screen::SCALE, @entity.x)
      assert.equal!(2 * Screen::SCALE, @entity.y)
    end

    test "#tick pans camera to added sprite" do |args|
      @camera.x = 5
      @camera.y = 5

      @entity.tick(args)

      sprite = args.outputs.sprites.first

      assert.equal!(@entity.x - @camera.x, sprite.x)
      assert.equal!(@entity.y - @camera.y, sprite.y)
    end
  end
end


