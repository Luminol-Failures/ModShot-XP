class Panomap
  def initialize(tileset)
    @tileset = tileset
    @panorama = Gosu::Image.new("Graphics/Panoramas/#{@tileset["panorama_name"]}.png", { tileable: true })
  end

  def draw(fx, fy, width, height)
    (width / (@panorama.width * fx)).ceil.times do |xoffset|
      (height / (@panorama.height * fy)).ceil.times do |yoffset|
        @panorama.draw(@panorama.width * fx * xoffset, @panorama.height * fy * yoffset, -100, fx, fy)
      end
    end
  end
end
