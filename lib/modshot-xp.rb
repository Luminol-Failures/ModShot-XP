#require_relative 'modshot-xp/version/version.rb'
#require "modshot-xp/version"
require 'ruby2d'
require_relative 'System_Mouse.rb'
require_relative 'LocationCache.rb'

$mouse = Mouse.new
$LocCache = LocationCache.new

module Modshotxp
  
  def self.init
    @ResX = 1620 
    @ResY = 760
    @BGColour = Color.new('#3e3e3e')
    Window.set width: @ResX, height: @ResY, resizable: true, title: "Modshot XP", background: @BGColour

    @midcur = Image.new(
      $LocCache.res + 'midcur.png',
      x: @MX, y: @MY,
      z: 10, width: 30, height: 30,
    )
    @midcur.remove
    
    @test = Image.new(
      $LocCache.res + 'blip.png',
      x: @ResX.div(2), y: @ResY.div(2),
    )
  end
  
  def self.moveshit
    @midcur.add
    
    @midcur.x = Window.mouse_x unless @midcuron == true
    @midcur.y = Window.mouse_y unless @midcuron == true
    @midcuron = true

    @test.x -= (@midcur.x - Window.mouse_x).div(10)
    @test.y -= (@midcur.y - Window.mouse_y).div(10)
  end
  
  def self.refresh
    $mouse.clicktoggle ? self.moveshit : @midcur.remove && @midcuron = false
  end
end

Modshotxp.init

update do
  #puts $mouse.delta_x.to_s + ' ' + $mouse.delta_y.to_s
  @MX = Window.mouse_x
  @MY = Window.mouse_y
  $mouse.update
  Modshotxp.refresh
  $mouse.delta_x = 0
  $mouse.delta_y = 0
end

show