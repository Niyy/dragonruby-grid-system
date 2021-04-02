class Grid_Object
    attr_accessor :col, :row
    @@w_tile = 32
    @@h_tile = 32

    def initialize(w, h)
        @@w_tile = w != nil ? w : 32
        @@h_tile = h != nil ? h : 32
    end


    def to_grid(coord)
        col_tile = coord[:x] / @@w 
        row_tile = coord[:y] / @@h 

        return {
            col: col_tile.floor,
            row: row_tile.floor
        }
    end


    def to_coord(tile)
        x_tile = (tile[:col] * @@w_tile)
        y_tile = (tile[:row] * @@h_tile)

        return {
            x: x_tile,
            y: y_tile,
        }
    end


    def self.get_w_tile()
        return @@w
    end


    def self.set_w_tile(w)
        @@w_tile = w
    end


    def self.get_h_tile()
        return @@h_tile
    end

    
    def self.set_h_tile(h)
        @@h_tile = h
    end


    # 1. Create a serialize method that returns a hash with all of
    #    the values you care about.
    def serialize()
        { w_tile: @@w_tile, h_tile: @@h_tile, col: @col, row: @row }
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