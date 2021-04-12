require 'app/require.rb'


def init(args)
  args.state.tiles << (0..3).map do |y|
    (0..4).map do |x|
      tile = Sprite_Grid_Object.new({
        args: args,
        col: x,
        row: y,
        path: 'sprites/snowWIP.png',
        source_y: y * 16 + 288,
        source_x: x * 16 + 17
      })

      tile.set_to_coord(tile.get_tile_position())
      tile
    end
  end

  puts "init_over"
end


def tick(args)
  init(args) if(args.state.tick_count == 0)

  args.outputs.sprites << args.state.tiles
end