class Game
  class BasicSprite < Output
    attr_accessor :x, :y, :w, :h, :path, :angle, :a, :r, :g, :b, :tile_x,
                  :tile_y, :tile_w, :tile_h, :flip_horizontally,
                  :flip_vertically, :angle_anchor_x, :angle_anchor_y, :id,
                  :angle_x, :angle_y, :z,
                  :source_x, :source_y, :source_w, :source_h, :blendmode_enum,
                  :source_x2, :source_y2, :source_x3, :source_y3, :x2, :y2, :x3, :y3,
                  :anchor_x, :anchor_y, :scale_quality_enum

    def initialize
      super(:sprite)
      # NOTE: Sprites are all 8x8
      @source_w = 8
      @source_h = 8
    end
  end

  class Sprite < BasicSprite
    SERIALIZED_ATTRIBUTES = %i(x y w h path)

    def initialize(x:, y:, size:, path:)
      super()
      self.x = x
      self.y = y
      self.w = size
      self.h = size
      self.path = path
    end
  end
end
