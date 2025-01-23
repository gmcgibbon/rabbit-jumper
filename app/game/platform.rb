class Game
  class Platform < Entity
    def initialize(x:, y:, size:, camera:)
      super(x: x, y: y, size: size, camera: camera, path: "sprites/platform.png")
    end
  end
end
