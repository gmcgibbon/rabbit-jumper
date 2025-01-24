# frozen_string_literal: true

class Game
  module Scenes
    class Play
      BACKGROUND_COLOR = [255, 204, 170].freeze

      def initialize(game)
        @game = game
      end

      def tick(args)
        args.outputs.background_color = BACKGROUND_COLOR
      end
    end
  end
end
