# frozen_string_literal: true

require "test/test_helper"

class Game
  class SpriteTest < TestCase
    setup do
      @sprite = Sprite.new(x: 2, y: 2, size: 4, path: "sprites/coin.png")
    end

    test "assigns x, y, w, h, and path" do
      assert.equal!(2, @sprite.x)
      assert.equal!(2, @sprite.y)
      assert.equal!(4, @sprite.w)
      assert.equal!(4, @sprite.h)
      assert.equal!("sprites/coin.png", @sprite.path)
    end

    test "sets source_w, source_h to 8" do
      assert.equal!(8, @sprite.source_w)
      assert.equal!(8, @sprite.source_h)
    end

    test "#primative_marker" do
      assert.equal!(:sprite, @sprite.primitive_marker)
    end
  end
end
