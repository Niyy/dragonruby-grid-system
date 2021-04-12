class Grid
    attr_accessor :tiles

    def initialize(init_args)
        @tiles = {}
    end


    def place_tile(tile)
        @tiles[tile.get_tile_position()] = {
            tile: tile, 
            level: 0
        }
    end
end