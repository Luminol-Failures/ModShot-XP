require "gosu"

class TestWindow < Gosu::Window
  def initialize
    super 640, 480, { resizable: true }
    self.caption = "Test window"
  end

  def update
  end

  def draw
    draw_rect(0, 0, width, height, Gosu::Color.rgba(200, 200, 200, 255), -500)
  end
end

TestWindow.new.show
