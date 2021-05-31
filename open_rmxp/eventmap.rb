class Eventmap
  #TODO: Acoount for hue
  def initialize(eventdata, tileset)
    @eventdata = eventdata
    @tileset = tileset

    @z = 100

    @eventbasegraphics = {}
    @eventgraphics = {}
    @eventdata.each do |key, value|
      unless value["pages"][0]["graphic"]["character_name"] == ""
        @eventbasegraphics[key] = Gosu::Image.new("Graphics/Characters/#{value["pages"][0]["graphic"]["character_name"]}.png")
        @eventgraphics[key] = Gosu::Image.load_tiles("Graphics/Characters/#{value["pages"][0]["graphic"]["character_name"]}.png", @eventbasegraphics[key].width / 4, @eventbasegraphics[key].height / 4, { tileable: true })
      else
        @eventbasegraphics[key] = value["pages"][0]["graphic"]["tile_id"]
        @eventgraphics[key] = value["pages"][0]["graphic"]["tile_id"]
      end
    end
    @event_overlay = Gosu::Image.new("open_rmxp/Graphics/no_event.png")

    @tilemap = Gosu::Image.load_tiles("Graphics/Tilesets/#{@tileset["tileset_name"]}.png", 32, 32, { tileable: true })
  end

  def draw(fx = 32, fy = 32)
    eventcoords = []
    @eventdata.each do |key, value|
      #! RPG Maker edge-case functionality
      #! No idea how this can happen but it does
      next if eventcoords.any? { |s| s.include?([value["x"], value["y"]].to_s) } # Go to next if the event coordinates match anything in this array

      if !@eventgraphics[key].is_a?(Integer) #|| key.to_i > 10
        #begin  + value["pages"][0]["graphic"]["pattern"]
        case value["pages"][0]["graphic"]["direction"]
        when 2
          direction = 0
        when 4
          direction = 4
        when 6
          direction = 8
        when 8
          direction = 12
        end

        @eventgraphics[key][direction + value["pages"][0]["graphic"]["pattern"]].draw(
          ((value["x"] * 32) - (@eventgraphics[key][0].width / 4)) * fx,
          ((value["y"] * 32) - (@eventgraphics[key][0].height / 2)) * fy,
          @z,
          fx,
          fy,
        )
        #TODO: Fix coordinates drawing off

      elsif @eventgraphics[key] > 0
        @tilemap[@eventgraphics[key] - 384].draw(value["x"] * 32 * fx, value["y"] * 32 * fy, @z, fx, fy)
      end

      @event_overlay.draw(value["x"] * 32 * fx, value["y"] * 32 * fy, @z, fx, fy) #? Always draw the overlay

      eventcoords << [value["x"], value["y"]].to_s
    end
  end
end
