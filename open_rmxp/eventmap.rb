class Eventmap
  def initialize(eventdata, tileset)
    @eventdata = eventdata
    @eventgraphics = []
    @eventdata.each do |key, value|
      begin
        puts "Graphics/Characters#{value["pages"][0]["graphic"]["character_name"]}.png"
        @eventgraphics << Gosu::Image.new("Graphics/Characters/#{value["pages"][0]["graphic"]["character_name"]}.png")
      rescue
        @eventgraphics << value["pages"][0]["graphic"]["tile_id"]
      end
    end
    puts @eventgraphics.to_s

    @tileset = tileset
    @tilemap = Gosu::Image.load_tiles("Graphics/Tilesets/#{@tileset["tileset_name"]}.png", 32, 32, { tileable: true })
  end

  def draw(fx = 32, fy = 32)
    #@eventdata.each do |key, value|
    #  begin
    #    @eventgraphics[key.to_i].draw(value["x"] * 32 * fx, value["y"] * 32 * fx, 100, fx, fy)
    #  rescue
    #    @tilemap[@eventgraphics[key.to_i]].draw(value["x"] * 32 * fx, value["y"] * 32 * fx, 100, fx, fy)
    #  end
    #end
  end
end
