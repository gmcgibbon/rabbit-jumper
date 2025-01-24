# frozen_string_literal: true

require "test/test_helper"

class GameTest < Game::TestCase
  setup do
    @game = Game.new
  end

  test "#tick renders title" do |args|
    @game.tick(args)

    assert.equal!(Game::Scenes::Title::Text, args.outputs.labels.first.class)
  end

  test "#scene= changes scene" do |args|
    @game.scene = Game::Scenes::Play.new(@game)

    @game.tick(args)

    assert.equal!(0, args.outputs.labels.count)
  end
end
