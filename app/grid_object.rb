class Grid_Object
    attr_accessor :col, :row, :w_tile, :h_tile

    def initialize(init_args)
        @w_tile = init_args[:w] != nil ? init_args[:w] : 32
        @h_tile = init_args[:h] != nil ? init_args[:h] : 32
    end


    def set_to_grid(coord)
        position = to_grid(coord)

        @col = position[:col]
        @row = position[:row]
    end


    def to_grid(coord)
        col_tile = coord[:x] / @w 
        row_tile = coord[:y] / @h 

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
        { w_tile: @w_tile, h_tile: @h_tile, col: @col, row: @row }
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