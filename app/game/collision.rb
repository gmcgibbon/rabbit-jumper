class Game
  module Collision
    def collide?(other)
      point.inside_rect?(other.box)
    end

    def top
      @y + @h
    end

    def box
      [@x, @y, @w, @h]
    end

    def point
      [@x + @w / 2, @y]
    end
  end
end
