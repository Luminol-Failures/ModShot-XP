#require_relative 'modshot-xp/version/version.rb'
#require "modshot-xp/version"
require 'flammarion'





module Modshotxp
  class Error < StandardError; end
  # Your code goes here...

  f = Flammarion::Engraving.new
  
  f.puts "Hello World!"
  

end