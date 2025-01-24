# frozen_string_literal: true

class Game
  class Player < Entity
    def initialize(x:, y:, size:, camera:)
      super(x: x, y: y, size: size, camera: camera, path: "sprites/hero-red-idle.png")

      @jump_tick = nil
      @acceleration = 1
      @jump_duration = 10
      @jump_power = 10
      @max_run_speed = 5
      @friction = 0.9
      @dx = 0
      @dy = 0
      @gravity = -0.3
      @animation = 0
    end

    def collide(entity)
      return unless collide?(entity) && @dy <= 0

      @y = entity.top
      @dy = 0
      @jump_tick = nil
    end

    def tick(args)
      super(args)

      animate

      if args.inputs.keyboard.s
        crouch
      elsif args.inputs.keyboard.key_up.s
        uncrouch
      else
        jump if args.inputs.keyboard.space
        right if args.inputs.keyboard.d
        left if args.inputs.keyboard.a
      end

      decay
    end

    private

    def decay
      @dx *= @friction
      @dx = 0 if (-0.01..0.01).cover?(@dx)
      @dy += @gravity
      @dy = 0 if (-0.01..0.01).cover?(@dy)
      @x += @dx
      @y += @dy
    end

    def animate
      @animation = if @jump_tick || @dy.negative?
                     1
                   elsif @crouch_tick
                     2
                   elsif !(-1..1).cover?(@dx)
                     @animation.frame_index(3, 8, true)
                   else
                     0
                   end
      @sprite.path = "sprites/hero-red-#{@animation}.png"
    end

    def left
      @dx -= @acceleration
      @dx = @dx.greater(-@max_run_speed)

      @sprite.flip_horizontally = true
    end

    def right
      @dx += @acceleration
      @dx = @dx.lesser(@max_run_speed)

      @sprite.flip_horizontally = false
    end

    def crouch
      @crouch_tick ||= Kernel.tick_count
    end

    def uncrouch
      @crouch_tick = nil
    end

    def jump
      @jump_tick ||= Kernel.tick_count
      duration = Kernel.tick_count - @jump_tick

      return unless duration < @jump_duration

      @dy = @jump_power
    end
  end
end
