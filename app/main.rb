# frozen_string_literal: true

require "app/game"

GAME = Game.new

def tick(args)
  GAME.tick(args)
end


# TODO:
# 1. Explore the codebase
# 2. Render the player
# 3. Make the player move
# 4. Animate the player while moving
