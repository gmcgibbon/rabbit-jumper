# frozen_string_literal: true

require "app/game/screen"
require "app/game/output"
require "app/game/collision"
require "app/game/sprite"
require "app/game/label"
require "app/game/camera"
require "app/game/scenes"
require "app/game/entity"
require "app/game/platform"
require "app/game/player"

class Game
  def initialize
    @scene = Scenes::Title.new(self)
  end

  attr_writer(:scene)

  def tick(args)
    @scene.tick(args)
  end
end
