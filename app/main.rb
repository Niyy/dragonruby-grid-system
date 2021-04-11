require 'app/require.rb'


def init(args)
  args.state.tiles << (0..3).map do |y|
    tile = Sprite_Grid_Object.new(
      {
        args: args,
        col: 0,
        row: y,
        w: 32,
        h: 32
        path: "sprites/snowWIP.png",
      }
    )
    tile.set_to_coord(tile.get_tile_position())
    tile
  end

  puts "init_over"
end


def tick(args)
  init(args) if(args.state.tick_count == 0)

  args.outputs.sprites << args.state.tiles
end