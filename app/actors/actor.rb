require 'app/grid_object.rb'
require 'app/sprite_grid_object.rb'


class Actor < Sprite_Grid_Object
    attr_accessor :selected, :attack_target, :health, :speed,
    :strength, :speed_build_up, :type, :base_health, :base_speed, :base_strength,
    :start_animation, :animation_increment, :move_tiles, :action_points


    def initialize(init_args)
        super(init_args)
        @working_out_path = false 
        @move_tiles = {} 
        @attack_target = nil
        @start_animation = nil
        @type = init_args[:type]
        @health = @base_health = init_args[:health] != nil ? init_args[:health] : 100
        @speed = @base_speed = init_args[:speed] != nil ? init_args[:speed] : 20
        @strength = @base_strength = init_args[:strength] != nil ? init_args[:strength] : 
            (5..20).to_a
        @speed_build_up = 0 
        @current_action_points = @action_points = 2
    end


    def clear()
        @working_out_path = false 
        @attack_target = nil
        @start_animation = nil
        @speed_build_up = 0
        @attack_target = nil
    end


    def set_move_tiles(grid)
        @move_tiles = {} 
        open_tiles = []
        closed_tiles = {}
        open_tiles << grid[@row][@col]
        
        while(!open_tiles.empty?)
            current_tile = open_tiles.shift()

            search_tiles(grid, current_tile, open_tiles, closed_tiles)

            closed_tiles[{col: current_tile.col, row: current_tile.row}] = current_tile
            if(current_tile != grid[@row][@col])
                @move_tiles[current_tile.get_tile_position] = current_tile
            end
        end
    end


    def search_tiles(grid, current, open_tiles, closed_tiles)
        left = grid[current.row][current.col - 1] 
        right = grid[current.row][current.col + 1] 
        down = grid[current.row - 1][current.col] if(grid[current.row - 1] != nil) 
        up = grid[current.row + 1][current.col] if(grid[current.row + 1] != nil)

        open_tiles << left if(add_tile?(grid, left, closed_tiles))
        open_tiles << right if(add_tile?(grid, right, closed_tiles))
        open_tiles << down if(add_tile?(grid, down, closed_tiles))
        open_tiles << up if(add_tile?(grid, up, closed_tiles))
    end


    def add_tile?(grid, tile, closed_tiles)
        if(in_bounds(grid, tile) && tile.marked == 0 && 
        find_manhattan(tile) <= @current_action_points &&
        !closed_tiles.has_key?({col: tile.col, row: tile.row}))
            return true
        end

        return false
    end


    def create_move_tile_overlay(grid, increment, current_row, current_col)
        tile = Sprite_Grid_Object.new({
            col: current_col,
            row: current_row,
            w: 32,
            h: 32,
            path: "sprites/square/green.png",
            x_offset: grid[:x_offset],
            y_offset: grid[:y_offset]
        })

        tile.set_to_coord(tile.get_tile_position)
        @move_tiles << tile
    end


    def move_to_tile(grid, tile)
        if(@move_tiles.has_key?(tile.get_tile_position))
            @current_action_points -= find_manhattan(tile) 
            set_everything_from_tile(tile.get_tile_position)

            set_move_tiles(grid)
        end
    end


    def in_bounds(grid, tile)

        if(tile == nil || tile.row < 0 || tile.row > grid[:max_x] || 
        tile.col < 0 || tile.col > grid[:max_y])
            return false
        end

        return true
    end

    
    def move_toward_target()

    end


    def damage(damage)
        puts "ARgh. That hurt. #{@type}"
        @health -= damage

        if(@health <= 0)
            return true
        end
    end


    def attack_target_on(tile)
    end


    def avalible_movement()

    end


    def pick_up_from(pick_up_symbol, tile)
    end


    def interact_with(interactable_symbol, tile)

    end


    def use_item(item_from_pack)

    end


    def find_manhattan(target)
        return (@col - target.col).abs +
            (@row - target.row).abs
    end


    def next_turn(grid)
        @current_action_points = @action_points
        set_move_tiles(grid)
    end


    # 1. Create a serialize method that returns a hash with all of
    #    the values you care about.
    def serialize()
        { x: @x, y: @y, w: @w, h: @h, path: @path, x_offset: @x_offset,
        y_offset: @y_offset, w_offset: @w_offset, h_offset: @h_offset,
        source_x: @source_x, source_y: @source_y, source_w: @source_w,
        source_h: @source_h, col: @col, row: @row, current_path: @current_path,
        attack_target: @attack_target, health: @health, speed: @speed,
        strength: @strength, move_tiles: move_tiles, action_points: action_points }
    end
end