class Eventmap
  def initialize(eventdata, tileset)
    @eventdata = eventdata
    @eventbasegraphics = {}
    @eventgraphics = {}
    @eventdata.each do |key, value|
      unless value["pages"][0]["graphic"]["character_name"] == ""
        @eventbasegraphics[key] = Gosu::Image.new("Graphics/Characters/#{value["pages"][0]["graphic"]["character_name"]}.png")
        @eventgraphics[key] = Gosu::Image.load_tiles("Graphics/Characters/#{value["pages"][0]["graphic"]["character_name"]}.png", @eventbasegraphics[key].width / 4, @eventbasegraphics[key].height / 4)
      else
        @eventbasegraphics[key] = value["pages"][0]["graphic"]["tile_id"]
        @eventgraphics[key] = value["pages"][0]["graphic"]["tile_id"]
      end
    end
  end

  def draw(fx = 32, fy = 32)
    @eventdata.each do |key, value|
      unless @eventgraphics[key].is_a?(Integer) #|| key.to_i > 10
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
          100,
          fx,
          fy,
        )
        #puts ((value["x"] * 32) - @eventgraphics[key][(value["pages"][0]["graphic"]["direction"] - 2) / 2 + value["pages"][0]["graphic"]["pattern"]].width / 4) * fx
        #rescue
        #end
      end
    end
  end
end
