# frozen_string_literal: true

require "test/test_helper"

class Game
  class PlayerTest < TestCase
    setup do
      @camera = Camera.new
      @player = Player.new(x: 0, y: 0, size: 1, camera: @camera)
    end

    test "#collide when colliding with other entity" do
      other = Player.new(x: 0, y: 0, size: 1, camera: @camera)

      @player.collide(other)

      assert.equal!(other.top, @player.y)
    end

    test "#collide when not colliding with other entity" do
      other = Player.new(x: 20, y: 20, size: 1, camera: @camera)

      @player.collide(other)

      assert.not_equal!(other.top, @player.y)
    end

    test "#tick applies gravity" do |args|
      assert.equal!(0, @player.y)

      @player.tick(args)

      assert.equal!(-0.3, @player.y)
    end
  end
end
