class GlobalSettings
  attr_accessor :background_color
  attr_accessor :xoffset
  attr_accessor :yoffset

  def initialize
    @background_color = Gosu::Color.rgba(200, 200, 200, 255)
    @xoffset = 32
    @yoffset = 32
  end
end
