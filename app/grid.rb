class Grid
    attr_accessor :tiles

    def initialize(init_args)
        @tiles = {}
    end


    def place_tile(tile, level)
        @tiles[tile.get_tile_position()] = []
    end
end