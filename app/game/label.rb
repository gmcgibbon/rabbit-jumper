class Game
  class Label < Output
    FONT = "fonts/tiny-5.ttf"
    SERIALIZED_ATTRIBUTES = %i(x y w h r g b a text size_px)

    attr_accessor :x, :y, :w, :h, :r, :g, :b, :a, :text, :font, :anchor_x,
                  :anchor_y, :blendmode_enum, :size_px, :size_enum, :alignment_enum,
                  :vertical_alignment_enum

    def initialize(x:, y:, w:, h:, r:, g:, b:, a:, size:, text:)
      super(:label)
      self.x = x
      self.y = y
      self.w = w
      self.h = h
      self.r = r
      self.g = g
      self.b = b
      self.a = a
      self.text = text
      self.size_px = size
      self.font = FONT
    end
  end
end
