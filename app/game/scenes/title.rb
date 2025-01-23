class Game
  module Scenes
    class Title
      BACKGROUND_COLOR = [255, 204, 170]

      class Text < Label
        def initialize
          super(x: 250, y: 550, w: 1, h: 1, r: 0, g: 0, b: 0, a: 200, size: 150, text: "Rabbit Jumper")
        end
      end

      def initialize(game)
        @game = game
        @title = Text.new
      end

      def tick(args)
        args.outputs.background_color = BACKGROUND_COLOR
        args.outputs.sprites << @background
        args.outputs.labels << @title

        start if args.inputs.keyboard.space || args.inputs.keyboard.enter
      end

      private

      def start
        @game.scene = Scenes::Play.new(@game)
      end
    end
  end
end
