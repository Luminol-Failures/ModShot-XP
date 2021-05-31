class Tilemap
  #TODO: Reverse-engineer the wacko autiltile system
  def initialize(tileset)
    @tileset = tileset
    @autotiles = [[]]
    @tileset["autotile_names"].each_with_index do |value|
      @autotiles << Gosu::Image.load_tiles("Graphics/Autotiles/#{value}.png", 32, 32, { tileable: true }) unless value == ""
    end
    @tilemap = Gosu::Image.load_tiles("Graphics/Tilesets/#{@tileset["tileset_name"]}.png", 32, 32, { tileable: true })
    @grid = Gosu::Image.new("open_rmxp/Graphics/tile_grid.png", { tileable: true })
  end

  def tileset=(tileset)
    @tilemap = Gosu::Image.load_tiles("Graphics/Tilesets/#{tileset}.png", 32, 32, { tileable: true })
  end

  def draw(data, fx = 32, fy = 32)
    data.each_with_index do |value, zindex|
      value.each_with_index do |value, yindex|
        eval(value).each_with_index do |value, xindex|
          if value < 48 * 8
            #begin
            #  @autotiles[value / 48][0].draw(xindex * 32 * fx, yindex * 32 * fy, zindex, fx, fy) unless value < 48
            #rescue
            #  puts "whoops"
            #  @tilemap[0].draw(xindex * 32 * fx, yindex * 32 * fy, zindex, fx, fy)
            #end
          else
            begin
              @tilemap[value - 384].draw(xindex * 32 * fx + $global_settings.xoffset, yindex * 32 * fy + $global_settings.yoffset, zindex, fx, fy) unless value == 0
            rescue
              @tilemap[0].draw(xindex * 32 * fx + $global_settings.xoffset, yindex * 32 * fy + $global_settings.yoffset, zindex, fx, fy)
            end
          end
          @grid.draw(xindex * 32 * fx + $global_settings.xoffset, yindex * 32 * fy + $global_settings.yoffset, zindex, fx, fy)
        end
      end
    end
  end
end
