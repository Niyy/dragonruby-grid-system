require 'app/require.rb'


def init(args)
  args.state.tiles << (0..20).map do |x|
    tile = Sprite_Grid_Object.new(
      args,
      x,
      0,
      "sprites/border-black.png",
      nil,
      nil,
      1,
      1
    )
    tile.second_init()
    tile
  end

  puts "init_over"
end


def tick(args)
  init(args) if(args.state.tick_count == 0)

  args.outputs.sprites << args.state.tiles
end