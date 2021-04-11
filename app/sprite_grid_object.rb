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
        @source_x = init_args[:x_source] != nil ? init_args[:x_source] : 0
        @source_y = init_args[:y_source] != nil ? init_args[:y_source] : 0
        @source_w = init_args[:w_source] != nil ? init_args[:w_source] : 0
        @source_h = init_args[:h_source] != nil ? init_args[:h_source] : 0
    end


    def set_to_coord(tile)
        position = to_coord(tile)

        @x = position[:x]
        @y = position[:y] 
    end


    def get_tile_position()
        return {col: @col, row: @row}
    end


    def get_coord_position()
        return {x: @x, y: @y}
    end
    # 1. Create a serialize method that returns a hash with all of
    #    the values you care about.
    def serialize()
        { x: @x, y: @y, w: @w, h: @h, path: @path, x_offset: @x_offset,
        y_offset: @y_offset, w_offset: @w_offset, h_offset: @h_offset }
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