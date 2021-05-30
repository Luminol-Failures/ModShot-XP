class GlobalSettings
  attr_accessor :background_color

  def initialize
    @background_color = Gosu::Color.rgba(200, 200, 200, 255)
  end
end
