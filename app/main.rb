# frozen_string_literal: true

require "app/game"

GAME = Game.new

def tick(args)
  GAME.tick(args)
end
