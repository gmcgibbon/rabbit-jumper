# frozen_string_literal: true

class Game
  module Scenes
    class Play
      BACKGROUND_COLOR = [255, 204, 170].freeze

      def initialize(game)
        @game = game
        @camera = Camera.new
        @player = Player.new(x: 0, y: 3, size: 3, camera: @camera)
        @platforms = 16.times.map { |n| Platform.new(x: n * 2, y: 0, size: 2, camera: @camera) }
        @platforms += 16.times.map { |n| Platform.new(x: n * 2, y: 6, size: 2, camera: @camera) }
        @platforms += 16.times.map { |n| Platform.new(x: n * 2, y: 12, size: 2, camera: @camera) }
        @platforms += 16.times.map { |n| Platform.new(x: n * 2, y: 18, size: 2, camera: @camera) }
      end

      def tick(args)
        args.outputs.background_color = BACKGROUND_COLOR
        @camera.focus(@player)
        @platforms.each do |platform|
          platform.tick(args)
          @player.collide(platform)
        end
        @player.tick(args)
      end
    end
  end
end
