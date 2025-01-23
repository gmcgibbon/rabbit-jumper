require "app/game"

GAME = Game.new

def tick(args)
  GAME.tick(args)
end
