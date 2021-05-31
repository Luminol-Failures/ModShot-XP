class Panomap
  #TODO: Account for hue
  def initialize(tileset)
    @tileset = tileset
    return if @tileset["panorama_name"] == ""
    @panorama = Gosu::Image.new("Graphics/Panoramas/#{@tileset["panorama_name"]}.png", { tileable: true })
  end

  def draw(fx, fy, width, height)
    return if @tileset["panorama_name"] == ""
    (width / (@panorama.width * fx)).ceil.times do |xoffset|
      (height / (@panorama.height * fy)).ceil.times do |yoffset|
        @panorama.draw(@panorama.width * fx * xoffset, @panorama.height * fy * yoffset, -100, fx, fy)
      end
    end
  end
end
