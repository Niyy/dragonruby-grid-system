require 'app/grid_object.rb'


class Sprite_Grid_Object < Grid_Object
    attr_sprite
    attr_accessor :w_offset, :h_offset, :x_offset, :y_offset

    def initialize(init_args)
        super(init_args)
        @args = init_args[:args]
        @col = init_args[:col]
        @row = init_args[:row]
        @path = init_args[:path]
        @w_offset = init_args[:w_offset] != nil ? init_args[:w_offset] : 0
        @h_offset = init_args[:h_offset] != nil ? init_args[:h_offset] : 0 
        @w = @w_tile + @w_offset
        @h = @h_tile + @h_offset
        @x_offset = init_args[:x_offset] != nil ? init_args[:x_offset] : 0
        @y_offset = init_args[:y_offset] != nil ? init_args[:y_offset] : 0
    end


    def second_init()
        tile = to_coord({col: @col, row: @row})
        @x = tile[:x] + @x_offset
        @y = tile[:y] + @y_offset
    end


    def to_grid(coord)
        col_tile = coord[:x] / @w_tile 
        row_tile = coord[:y] / @h_tile 

        return {
            col: col_tile.floor,
            row: row_tile.floor
        }
    end


    def to_coord(tile)
        x_tile = (tile[:col] * @w_tile)
        y_tile = (tile[:row] * @h_tile)

        return {
            x: x_tile,
            y: y_tile,
        }
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