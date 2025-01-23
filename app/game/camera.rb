class Game
  class Camera
    attr_accessor(:x, :y)

    def initialize
      @x = 0
      @y = 0
    end

    def focus(entity)
      @x = entity.x - 600
      @y = entity.y - 200
    end
  end
end
