#require_relative 'modshot-xp/version/version.rb'
#require "modshot-xp/version"
require 'ruby2d'


  


module Modshotxp
  class Error < StandardError; end
  # Your code goes here...

  Window.set width: 1490, height: 880
  
  # Create a new shape
  TestImage = Image.new(
    'lib/modshot-xp/res/blip.png'
  )
  #TestImage.color = 'red'

  Window.show


end