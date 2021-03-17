require 'app/require.rb'


def init(args)
  args.state.units = []
  args.state.tiles = []

  (0..20).each do |row|
    args.state.borders << (0..20).map do |col|
      tile = Sprite_Grid_Object.new({
        args: args,
        w_tile: 32,
        h_tile: 32,
        col: col,
        row: row,
        path: "sprites/border-black.png",
        x_offset: nil,
        y_offset: nil,
        w_offset: 1,
        h_offset: 1
      })
      tile.second_init()
      tile
    end
  end

  (0..20).each do |row|
    args.state.tiles << (0..20).map do |col|
      tile = Sprite_Grid_Object.new({
        args: args,
        w_tile: 32,
        h_tile: 32,
        col: col,
        row: row,
        path: "sprites/square-violet.png"
      })
      tile.second_init()
      tile.a = 50
      tile
    end
  end

  args.state.units << create_unit(args, "sprites/square/black.png", 4, 4)

  puts "init_over"
end


def create_unit(args, paths, col, row)
  unit = Sprite_Grid_Object.new({
    args: args,
    w_tile: 16,
    h_tile: 16,
    x_offset: 8,
    y_offset: 8,
    col: col,
    row: row,
    path: paths 
  })
  unit.second_init()
  unit 
end


def tick(args)
  init(args) if(args.state.tick_count == 0)

  args.outputs.sprites << args.state.borders
  args.outputs.sprites << args.state.tiles
  args.outputs.sprites << args.state.units
end