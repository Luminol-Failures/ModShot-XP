class SashFormPresenter
  include Glimmer

  attr_accessor :sash_width, :orientation, :orientation_style

  def initialize(width, orientation)
    @sash_width = width
    self.orientation = orientation
  end

  def orientation_options
    ["horizontal", "vertical"]
  end

  def orientation=(value)
    @orientation = value
    self.orientation_style = swt(@orientation)
  end
end
