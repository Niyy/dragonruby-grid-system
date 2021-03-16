require 'app/grid_object.rb'


class Sprite_Grid_Object < Grid_Object
    attr_sprite
    attr_accessor :w_offset, :h_offset, :x_offset, :y_offset


    def initialize(args, col, row, path, w_tile, h_tile, w_offset, 
    h_offset, x_offset = nil, y_offset = nil)
        super(w_tile, h_tile)
        @args = args
        @col = col
        @row = row
        @path = path
        @w_offset = w_offset != nil ? w_offset : 0
        @h_offset = h_offset != nil ? h_offset : 0 
        @w = @@w_tile + @w_offset
        @h = @@h_tile + @h_offset
        @x_offset = x_offset != nil ? x_offset : 0
        @y_offset = y_offset != nil ? y_offset : 0
    end


    def second_init()
        tile = to_coord({col: @col, row: @row})
        @x = tile[:x]
        @y = tile[:y]
    end


    # 1. Create a serialize method that returns a hash with all of
    #    the values you care about.
    def serialize()
        { x: @x, y: @y, w: @w, h: @h, path: @path, x_offset: @x_offset,
        y_offset: @y_offset }
    end


    # 2. Override the inspect method and return ~serialize.to_s~.
    def inspect()
        serialize.to_s()
    end


    # 3. Override to_s and return ~serialize.to_s~.
    def to_s()
        serialize.to_s()
    end
end